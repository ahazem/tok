describe Tok::Configuration do
  before :all do
    class Account < ActiveRecord::Base; end
    class User < ActiveRecord::Base; end
  end

  describe ".model" do
    context "by default" do
      it { expect(Tok::Configuration.new.model).to eq ::User }
    end

    context "when specified" do
      before do
        Tok.configure do |config|
          config.model = Account
        end
      end
      
      it { expect(Tok.configuration.model).to eq Account }
    end
  end

  describe ".bcrypt_cost" do
    context "by default" do
      subject { Tok::Configuration.new.bcrypt_cost }

      context "while in test environment" do
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

    context "when specified" do
      before do
        allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('development'))

        Tok.configure do |config|
          config.bcrypt_cost = 20
        end
      end

      it { expect(Tok.configuration.bcrypt_cost).to eq 20 }
    end
  end

  describe ".signup_route" do
    context "by default" do
      it { expect(Tok::Configuration.new.signup_route).to eq "signup" }
    end

    context "when specified" do
      before do
        Tok.configure do |config|
          config.signup_route = "register"
        end
      end

      it { expect(Tok.configuration.signup_route).to eq "register" }
    end
  end

  describe ".login_route" do
    context "by default" do
      it { expect(Tok::Configuration.new.login_route).to eq "login" }
    end

    context "when specified" do
      before do
        Tok.configure do |config|
          config.login_route = "signin"
        end
      end

      it { expect(Tok.configuration.login_route).to eq "signin" }
    end
  end

  describe ".logout_route" do
    context "by default" do
      it { expect(Tok::Configuration.new.logout_route).to eq "logout" }
    end

    context "when specified" do
      before do
        Tok.configure do |config|
          config.logout_route = "signout"
        end
      end

      it { expect(Tok.configuration.logout_route).to eq "signout" }
    end
  end
end
