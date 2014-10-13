require 'tok/engine'
require 'tok/configuration'
require 'tok/controller'
require 'tok/version'

module Tok
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end
end
