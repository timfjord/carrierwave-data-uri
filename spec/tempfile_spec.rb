RSpec.describe CarrierWave::DataUri::Tempfile do
  let(:options) { {} }
  let(:data_uri) do
    'data:image/gif;base64,R0lGODlhAQABAJEAAAAAAP////8AAP///yH5BAEAAAMALAAAAAABAAEAAAICVAEAOw=='
  end

  let(:tempfile) do
    CarrierWave::DataUri::Parser.new(data_uri).to_file(options)
  end


  describe '#content_type' do
    subject(:content_type) { tempfile.content_type }

    describe 'without a content_type supplied' do
      specify { expect(content_type).to eq 'image/gif' }
    end

    describe 'with a specified content_type' do
      let(:options) { { content_type: 'image/jpeg' } }
      specify { expect(content_type).to eq 'image/jpeg' }
    end
  end
end
