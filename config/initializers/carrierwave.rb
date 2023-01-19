CarrierWave.configure do |config|
  if !Rails.env.test? && !ENV['PRECOMPILING_ASSETS']
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['SPACES_ACCESS_KEY'] || Rails.application.credentials.spaces_access_key,
      aws_secret_access_key: ENV['SPACES_SECRET_KEY'] || Rails.application.credentials.spaces_secret_key,
      region:                'nyc3',
      endpoint:              'https://nyc3.digitaloceanspaces.com'
    }
    config.fog_directory = ENV['SPACES_NAME'] || 'lincolnchurch-staging'
  end
end
