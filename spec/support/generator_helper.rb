module Tok
  module GeneratorHelpers
    def reset_destination
      FileUtils.rm_rf(destination_root)
    end
  end
end
