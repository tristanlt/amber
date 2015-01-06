# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Amber::Application.configure do
  config.shorttitle = 'Amber'
  config.longtitle = "Another MongoDB Blog Energized by Rails"
  config.manager = ['admin@amberblog.local']
  config.autosubscribe = true
  # Set roottype blog or page (soon)
  config.roottype = ''
  # Set id of root target
  config.rootshortid = ''
end