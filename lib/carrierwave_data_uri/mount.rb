module CarrierWave
  module DataUri
    module Mount
      ##
      # See +CarrierWave::Mount#mount_uploader+ for documentation
      #
      def mount_uploader(column, uploader=nil, options={}, &block)
        super

        class_eval <<-RUBY, __FILE__, __LINE__+1
          attr_accessor :#{column}_data_uri
          attr_accessor :#{column}_data_filename

          def #{column}_data_uri=(data)
            original_filename = self.#{column}_data_filename.presence

            if data.present?
              self.#{column} = Parser.new(data).to_file original_filename: original_filename
            end
          end
        RUBY
      end
    end
  end
end
