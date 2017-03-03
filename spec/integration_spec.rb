RSpec.describe 'Integration' do
  ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'
  ActiveRecord::Base.raise_in_transactional_callbacks = true
  ActiveRecord::Migration.verbose = false

  class TestMigration < ActiveRecord::Migration
    def self.up
      create_table :images, :force => true do |t|
        t.column :src, :string
      end
    end

    def self.down
      drop_table :images
    end
  end

  class ImageUploader < CarrierWave::Uploader::Base; end

  class Image < ActiveRecord::Base
    mount_uploader :src, ImageUploader
  end

  before(:all) { TestMigration.up }
  after(:all) { TestMigration.down }
  after { Image.destroy_all }

  let(:gif_data_uri) do
    'data:image/gif;base64,R0lGODlhAQABAJEAAAAAAP////8AAP///yH5BAEAAAMALAAAAAABAAEAAAICVAEAOw=='
  end
  let(:jpeg_data_uri) do
    'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/4QAWRXhpZgAASUkqAAgAAAAAAAAAAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCAABAAEDASIAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAr/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFAEBAAAAAAAAAAAAAAAAAAAAAP/EABQRAQAAAAAAAAAAAAAAAAAAAAD/2gAMAwEAAhEDEQA/AL+AAf/Z'
  end
  let(:image) { Image.new }

  it 'should save image with data_uri' do
    image.src_data_uri = gif_data_uri
    image.save!

    expect(image[:src]).to be_present
    expect(image.src.file.filename).to end_with '.gif'
  end

  it 'should create image with data_uri' do
    new_image = Image.create! src_data_uri: gif_data_uri

    expect(new_image[:src]).to be_present
    expect(new_image.src.file.filename).to end_with '.gif'
  end

  it 'should update image with data_uri' do
    image.src_data_uri = gif_data_uri
    image.save!

    image.update src_data_uri: jpeg_data_uri

    expect(image.src.file.filename).to end_with '.jpeg'
  end

  it 'should allow to retrieve passed data' do
    image.src_data_uri = gif_data_uri

    expect(image.src_data_uri).to eql gif_data_uri
  end

  it 'should not raise an error on assignig empty string' do
    expect{image.src_data_uri = ''}.not_to raise_error
  end

  it 'should allow to assign data to the loud version of setter but disallow to retrieve passed data' do
    image.src_data_uri_loud = gif_data_uri
    image.save!

    expect(image[:src]).to be_present
    expect(image.src.file.filename).to end_with '.gif'
    expect(image.src_data_uri).to be_nil
  end

  it 'should raise an error on assignig empty string to the loud version' do
    expect{image.src_data_uri_loud = ''}.to raise_error CarrierWave::DataUri::InvalidData
  end
end
