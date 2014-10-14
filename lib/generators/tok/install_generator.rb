module Tok
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      class_option :model, type: :string, aliases: "-m", desc: "Specify a model different than User"

      def copy_initializer
        template "tok.rb", "config/initializers/tok.rb"
      end
    end
  end
end
