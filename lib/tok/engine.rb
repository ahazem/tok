require 'tok'
require 'rails'

module Tok
  class Engine < Rails::Engine
    isolate_namespace Tok

    initializer :append_migrations do |app|
      config.paths["db/migrate"].expanded.each do |expanded_path| 
        app.config.paths["db/migrate"] << expanded_path
      end
    end
  end
end
