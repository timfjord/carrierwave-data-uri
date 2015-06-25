require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'carrierwave_data_uri/tempfile'
require 'carrierwave_data_uri/parser'
require 'carrierwave_data_uri/version'
require 'carrierwave_data_uri/mount'

ActiveRecord::Base.extend CarrierWave::DataUri::Mount if defined?(ActiveRecord)
