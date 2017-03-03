require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'carrierwave/sequel'
require 'carrierwave_data_uri/tempfile'
require 'carrierwave_data_uri/parser'
require 'carrierwave_data_uri/version'
require 'carrierwave_data_uri/mount'

if defined?(Sequel)
  Sequel::Model.send :extend, CarrierWave::DataUri::Mount
elsif defined
  ActiveRecord::Base.extend CarrierWave::DataUri::Mount
end
