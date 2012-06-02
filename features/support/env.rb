require_relative '../../lib/index'
require 'capybara/cucumber'

Capybara.app = Sinatra::Application
Sinatra::Application.set :environment, :test