CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.fog_provider    = 'fog/aws'
    config.fog_credentials = {
      :provider            => 'AWS',
      :region              => ENV['AWS_S3_REGION'],
      :use_iam_profile     => true,
    }
    config.fog_public      = true
    config.fog_directory   = ENV['AWS_S3_BUCKET']
    config.asset_host      = ENV['RAILS_ASSET_HOST']
    config.storage = :fog
  else
    config.storage = :file
    config.enable_processing = false
  end
end
