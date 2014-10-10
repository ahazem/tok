require 'spec_helper'

describe Tok do
  after { reset_configuration }

  describe '#configure' do
    context 'when a resource is specified' do
      before do
        Person = Class.new

        Tok.configure do |config|
          config.resource = Person 
        end
      end

      it { expect(Tok.configuration.resource).to eq Person}
    end

    context 'when no resource is specified' do
      before do
        Tok.configure do |config|
        end
      end

      it { expect(Tok.configuration.resource).to eq User }
    end
  end

  it 'has a version number' do
    expect(Tok::VERSION).not_to be nil
  end
end
