require 'spec_helper'
require 'generators/tok/install_generator'

describe Tok::Generators::InstallGenerator do
  destination File.expand_path('../../dummy/tmp', __FILE__)

  before do
    prepare_destination
    generate_tmp_files
    run_generator
  end

  describe "#copy_initializer" do
    subject { file('config/initializers/tok.rb') }

    it { expect(subject).to exist }
    it { expect(subject).to contain(/Tok.configure do \|config\|/) }
  end

  describe ".include_tok_into_application_controller" do
    subject { file('app/controllers/application_controller.rb') }

    it { expect(subject).to exist }
    it { expect(subject).to contain(/include Tok::Controller/) }
  end

  after do
    reset_destination
  end
end
