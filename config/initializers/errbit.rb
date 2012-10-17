Airbrake.configure do |config|
  config.api_key = '6f24e9447398a8c3bed5152a65f5dfc0'
  config.host    = 'pau-errbit.herokuapp.com'
  config.port    = 80
  config.secure  = config.port == 443
end
