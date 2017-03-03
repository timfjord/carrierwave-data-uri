require 'data_uri'

module CarrierWave
  module DataUri
    class Parser
      attr_reader :type, :encoder, :data, :extension

      def initialize(data_uri)
        uri = URI::Data.new data_uri
        @type = uri.content_type
        @extension = @type.split('/')[1]
        @data = uri.data
      rescue URI::InvalidURIError
        raise InvalidData, 'Cannot parse data'
      end

      def binary_data
        @data
      end

      def to_file(options = {})
        @file ||= begin
          file = Tempfile.new ['data_uri_upload', ".#{extension}"]
          file.binmode
          file << binary_data
          file.rewind
          file.original_filename = options[:original_filename]
          file.content_type = options[:content_type]
          file
        end
      end
    end

    class InvalidData < StandardError; end
  end
end
