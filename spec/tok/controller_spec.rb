describe Tok::Controller do
  subject { Tok::BaseController.new }

  before do
    Tok.configure do |config|
      config.model = Account 
    end
  end

  describe ".model" do
    it { expect(subject).to respond_to :model }
    it { expect(subject.model).to eq Tok.configuration.model.to_s }
  end

  describe ".model_name" do
    it { expect(subject).to respond_to :model_name } 
    it { expect(subject.model_name).to eq Tok.configuration.model.to_s.downcase }
  end

  describe ".model_class" do
    it { expect(subject).to respond_to :model_class }
    it { expect(subject.model_class).to eq Tok.configuration.model.to_s.constantize }
  end
end
