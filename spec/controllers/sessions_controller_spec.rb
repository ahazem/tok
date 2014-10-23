describe Tok::SessionsController do
  before do
    class User < ActiveRecord::Base
      include Tok::Authentication
    end
  end

  describe "#create" do
    context "with valid credentials" do
      subject { attributes_for(:user) } 

      before do
        post :create, {user: subject}, {"Accept" => "application/json", "Content-Type" => "application/json"}
      end

      it { expect(response).to be_success }
    end
  end

  describe "#destroy" do
    context "when logged in" do
      let(:user_params) { attributes_for(:user) }

      before do
        @user = create(:user)
        @user.class.authenticate(user_params)

        delete :destroy, {}, {"Accept" => "application/json", "Content-Type" => "application/json"}
      end

      it { expect(response).to be_success }
    end
  end
end
