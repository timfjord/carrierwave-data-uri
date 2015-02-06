module CarrierWave
  module DataUri
    module Mount
      ##
      # See +CarrierWave::Mount#mount_uploader+ for documentation
      #
      def mount_uploader(column, uploader=nil, options={}, &block)
        super

        class_eval <<-RUBY, __FILE__, __LINE__+1
          def #{column}_data_uri=(data)
            self.#{column} = Parser.new(data).to_file
          end
        RUBY
      end
    end
  end
end
