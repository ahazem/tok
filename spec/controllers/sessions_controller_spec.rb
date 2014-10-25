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
        @user = create(:user)

        post :create, {user: subject}, {"Accept" => "application/json", "Content-Type" => "application/json"}
      end

      it { expect(response).to be_success }
      it { expect(response).to have_http_status :created }
      it { expect(response.body).to eq @user.to_json } 
    end

    context "with invalid credentials" do
      subject { attributes_for(:user) }

      before do
        post :create, {user: subject}, {"Accept" => "application/json", "Content-Type" => "application/json"}
      end

      it { expect(response).to_not be_success }
      it { expect(response).to have_http_status :unprocessable_entity }
      it { expect(json).to have_key("error") }
      it { expect(json["error"]).to eq "Invalid email or password!" }
    end
  end

  describe "#destroy" do
    context "when logged in" do
      let(:user_params) { attributes_for(:user) }

      before do
        @user = create(:user)
        @user.class.authenticate(user_params)

        delete :destroy, {token: @user.authentication_token}, {"Accept" => "application/json", "Content-Type" => "application/json"}
      end

      it { expect(response).to be_success }
      it { expect(response).to have_http_status :no_content }
      it { expect{@user.reload}.to change{@user.authentication_token} }
    end

    context "when not logged in" do
      before do
        delete :destroy, {token: "not-valid"}, {"Accept" => "application/json", "Content-Type" => "application/json"}
      end

      it { expect(response).to be_success }
      it { expect(response).to have_http_status :no_content } 
    end
  end
end
