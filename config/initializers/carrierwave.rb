CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    # aws_access_key_id: 'aaaa',
    # ENV['AWS_ACCESS_KEY_ID'],
    # aws_secret_access_key: 'aaaa',
    # ENV['AWS_SECRET_ACCESS_KEY'],
    # region: ENV['AWS_REGION']
  }
      
  config.fog_public = true
  config.fog_directory = ENV['AWS_BUCKET_NAME']
  config.asset_host = "https://s3-#{ENV['AWS_REGION']}.amazonaws.com/#{ENV['AWS_BUCKET_NAME']}"
end
