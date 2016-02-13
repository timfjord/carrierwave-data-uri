require 'base64'

module CarrierWave
  module DataUri
    class Parser
      attr_reader :type, :encoder, :data, :extension

      def initialize(data_uri)
        if data_uri.match /^data:(.*?);(.*?),(.*)$/
          @type = $1
          @encoder = $2
          @data = $3
          @extension = $1.split('/')[1]
        else
          raise ArgumentError, 'Cannot parse data'
        end
      end

      def binary_data
        @binary_data ||= Base64.decode64 data
      end

      def to_file(options = {})
        @file ||= begin
          file = Tempfile.new ['data_uri_upload', ".#{extension}"]
          file.binmode
          file << binary_data
          file.rewind
          file.original_filename = options[:original_filename] || "temp.#{extension}"
          file
        end
      end
    end
  end
end
