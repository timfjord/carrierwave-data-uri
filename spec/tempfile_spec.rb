RSpec.describe CarrierWave::DataUri::Tempfile do
  let(:options) { {} }
  let(:data_uri) do
    'data:image/gif;base64,R0lGODlhAQABAJEAAAAAAP////8AAP///yH5BAEAAAMALAAAAAABAAEAAAICVAEAOw=='
  end

  let(:tempfile) do
    CarrierWave::DataUri::Parser.new(data_uri).to_file(options)
  end

  describe '#original_filename' do
    subject { tempfile.original_filename }

    context 'without an original_filename supplied' do
      it { is_expected.to start_with 'data_uri_upload' }
    end

    context 'with a specified original_filename' do
      let(:options) { { original_filename: 'my_name.jpg' } }

      it { is_expected.to eq 'my_name.jpg' }
    end
  end

  describe '#content_type' do
    subject { tempfile.content_type }

    context 'without a content_type supplied' do
      it { is_expected.to eq 'image/gif' }
    end

    context 'with a specified content_type' do
      let(:options) { { content_type: 'image/jpeg' } }

      it { is_expected.to eq 'image/jpeg' }
    end
  end
end
