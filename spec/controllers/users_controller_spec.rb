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
    end
  end
end
