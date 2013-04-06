Airbrake.configure do |config|
  config.api_key = '94af6ca29e6d478bdcaa257d26a8e923'
  config.host    = 'pau-errbit.herokuapp.com'
  config.port    = 80
  config.secure  = config.port == 443
end
