CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => "AKIAJH5F3IJPRCG76MMQ",       # required
    :aws_secret_access_key  => "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",       # required
  }
  config.fog_directory  = 'peekbox'                     # required
	config.storage = :fog
end
