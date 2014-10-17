require 'tok'
require 'rails'

module Tok
  class Engine < Rails::Engine
    isolate_namespace Tok

    initializer :append_migrations do |app|
      if user_model_exist?
        config.paths["db/migrate"].expanded.each do |expanded_path| 
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    private

    def user_model_exist?
      Rails.env.test? ? true : File.exist?(File.expand_path('app/models/user.rb', Rails.root)) 
    end
  end
end
