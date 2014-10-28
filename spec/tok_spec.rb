require 'spec_helper'

describe Tok do
  after { reset_configuration }

  describe '.configure' do
    context 'when a model is specified' do
      before do
        Person = Class.new

        Tok.configure do |config|
          config.model = Person 
        end
      end

      it { expect(Tok.configuration.model).to eq Person}
    end

    context 'when no model is specified' do
      before do
        Tok.configure do |config|
        end
      end

      it { expect(Tok.configuration.model).to eq User }
    end
  end
end
