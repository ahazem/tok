describe Tok::UsersController do
  before do
    class User < ActiveRecord::Base
      include Tok::Authentication
    end
  end

  describe "#create" do
    context "with valid parameters" do
      subject { attributes_for(:user) }

      before do
        post :create, {user: subject}, {"Accept" => "application/json", "Content-Type" => "application/json"} 
      end

      it { expect(response).to be_success }
      it { expect(response).to have_http_status(:created) }
      it { expect(response.body).to eq User.last.to_json }

      it { expect(assigns(:resource)).to be_persisted }
      it { expect(assigns(:resource)).to eq User.last }

      it "should increase users count" do
        change(User, :count).by(1)
      end
    end
  end
end
