module Tok
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_initializer
        template "tok.rb", "config/initializers/tok.rb"
      end
    end
  end
end
