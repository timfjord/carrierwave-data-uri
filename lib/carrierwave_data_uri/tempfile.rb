require 'tempfile'

module CarrierWave
  module DataUri
    class Tempfile < ::Tempfile
      attr_writer :original_filename

      def original_filename
        @original_filename
      end
    end
  end
end
