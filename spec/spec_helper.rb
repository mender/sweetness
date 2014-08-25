require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'sweetness'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.order = :random
end
