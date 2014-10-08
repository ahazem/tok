ENV["RAILS_ENV"] = "test"

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'tok'

require File.expand_path('../dummy/config/environment.rb', __FILE__)
require 'rspec/rails'
require 'factory_girl_rails'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end
