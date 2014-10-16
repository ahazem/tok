require 'rails/generators/migration'
require 'rails/generators/active_record'

module Tok
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("../templates", __FILE__)

      class_option :model, type: :string, aliases: "-m", desc: "Specify a model different than User"

      def copy_initializer
        template "tok.rb", "config/initializers/tok.rb"
      end

      def create_tok_migration
        if options[:model]
          migration_template "migration/create_model.rb", "db/migrate/create_#{options[:model].downcase.pluralize}.rb"
        end
      end

      def self.next_migration_number(dir)
        ActiveRecord::Generators::Base.next_migration_number(dir)
      end

      private

      def model_class
        options[:model].classify
      end
    end
  end
end
