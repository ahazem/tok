module Tok
  module GeneratorHelpers
    def generate_tmp_files
      files = %w(
        app/controllers/application_controller.rb
        app/models/user.rb
      )

      files.each { |f| FileUtils.mkdir_p(File.join(destination_root, File.dirname(f))) }

      File.open(File.join(destination_root, files[0]), 'w') do |f|
        f.write "class ApplicationController < ActionController::API\n"
        f.write "end"
      end
    end

    def reset_destination
      FileUtils.rm_rf(destination_root)
    end
  end
end
