ENV["RAILS_ENV"] = "test"

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rails/all'
require 'tok'

require File.expand_path('../dummy/config/environment.rb', __FILE__)
require 'rspec/rails'
require 'ammeter/init'
require 'factory_girl_rails'

Dir[File.expand_path('../../spec/support/**/*.rb', __FILE__)].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Tok::GeneratorHelpers
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end

def reset_configuration
  Tok.configuration = nil
  Tok.configure {}
end
