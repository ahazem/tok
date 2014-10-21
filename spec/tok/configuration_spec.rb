describe Tok::Configuration do
  before :all do
    class Account < ActiveRecord::Base; end
    class User < ActiveRecord::Base; end
  end

  describe "#resource" do
    it "has a default value User" do
      expect(Tok::Configuration.new.resource).to eq ::User
    end
  end

  describe "#resource=" do
    before do
      Tok.configure do |config|
        config.resource = Account
      end
    end

    it { expect(Tok.configuration.resource).to eq Account }
  end

  describe "#bcrypt_cost" do
    subject { Tok::Configuration.new.bcrypt_cost }

    context "while in test environment" do
      before do
        Tok.configure {}
      end

      it { expect(subject).to eq BCrypt::Engine::MIN_COST }
    end

    context "while in other environments" do
      before do
        # Stub Rails.env
        allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('development'))

        Tok.configure {} 
      end

      it { expect(subject).to eq BCrypt::Engine::DEFAULT_COST }
    end
  end

  describe "#bcrypt_cost=" do
    before do
      allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('development'))

      Tok.configure do |config|
        config.bcrypt_cost = 20
      end
    end

    it { expect(Tok.configuration.bcrypt_cost).to eq 20 }
  end
end
