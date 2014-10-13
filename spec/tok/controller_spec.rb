describe Tok::Controller do
  subject { Tok::Controller }

  before do
    Tok.configure do |config|
      config.resource = Account 
    end
  end

  describe ".resource_name" do
    it { expect(subject).to respond_to :resource_name } 
    it { expect(subject.resource_name).to eq Tok.configuration.resource.to_s.downcase }
  end

  describe ".resource_class" do
    it { expect(subject).to respond_to :resource_class }
    it { expect(subject.resource_class).to eq Tok.configuration.resource.to_s.constantize }
  end
end