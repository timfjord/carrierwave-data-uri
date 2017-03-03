module CarrierWave
  module DataUri
    module Mount
      ##
      # See +CarrierWave::Mount#mount_uploader+ for documentation
      #
      def mount_uploader(column, uploader=nil, options={}, &block)
        super

        class_eval <<-RUBY, __FILE__, __LINE__+1
          attr_reader :#{column}_data_uri
          attr_accessor :#{column}_data_filename, :#{column}_data_mimetype

          def #{column}_data_uri_loud=(data)
            self.#{column} = Parser.new(data).to_file(
              original_filename: self.#{column}_data_filename,
              content_type: self.#{column}_data_mimetype
            )
          end

          def #{column}_data_uri=(data)
            @#{column}_data_uri = data
            self.#{column}_data_uri_loud = data
          rescue CarrierWave::DataUri::InvalidData
          end
        RUBY
      end
    end
  end
end
