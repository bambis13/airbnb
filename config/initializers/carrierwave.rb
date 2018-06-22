require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'

# 本番で立ち上げる用
  # config.fog_credentials = {
  #   provider: 'AWS',
  #   aws_access_key_id: Rails.application.secrets.aws_access_key_id,
  #   aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
  #   region: 'ap-northeast-1'
  # }

# ローカルで立ち上げる用
config.fog_credentials = {
  provider:              'AWS',
  aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV["AWS_ACCESS_KEY_ID"],
  region:                'ap-northeast-1'
}

  config.fog_directory  = 'techexp-airbnb'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/techexp-airbnb'
end


