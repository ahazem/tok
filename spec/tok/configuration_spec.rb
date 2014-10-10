describe Tok::Configuration do
  before :all do
    User = Class.new 
    Account = Class.new
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
end
