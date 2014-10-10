require 'spec_helper'
require 'generators/tok/install_generator'

describe Tok::Generators::InstallGenerator do
  destination File.expand_path('../../dummy/tmp', __FILE__)

  before do
    prepare_destination
    run_generator
  end

  describe "#copy_initializer" do
    subject { file('config/initializers/tok.rb') }

    it { expect(subject).to exist }
    it { expect(subject).to contain(/Tok.configure do \|config\|/) }
  end

  after do
    reset_destination
  end
end
