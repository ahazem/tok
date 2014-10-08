require 'tok'

module Tok
  class Engine < Rails::Engine
    isolate_namespace Tok
  end
end
