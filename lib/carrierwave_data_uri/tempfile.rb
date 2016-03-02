require 'tempfile'

module CarrierWave
  module DataUri
    class Tempfile < ::Tempfile
      attr_writer :original_filename, :content_type

      def original_filename
        @original_filename || File.basename(path)
      end

      def content_type
        @content_type || MIME::Types.type_for(original_filename).first.content_type
      end

    end
  end
end
