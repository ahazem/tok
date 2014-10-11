describe Tok::UsersController do
  routes { Tok::Engine.routes }

  describe "#sign_up" do
    context "with valid parameters" do
      subject { attributes_for(:user) }
      let(:resource_count) { Tok::Base.resource_class.count }

      before do
        post :create, {user: subject}, {"Accept" => "application/json", "Content-Type" => "application/json"} 
      end

      it { expect(response).to be_success }
      it { expect(response).to have_http_status(:created) }
    end
  end
end
