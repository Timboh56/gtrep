# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Gtrep::Application.initialize!

config.gem "declarative_authorization", :source => "http://gemcutter.org"


ENV['RAILS_ENV'] ||= 'production'
