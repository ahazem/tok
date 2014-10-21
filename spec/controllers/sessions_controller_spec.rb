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
        create(:user)

        post :create, {user: subject}, {"Accept" => "application/json", "Content-Type" => "application/json"}
      end

      it { expect(response).to be_success }
    end
  end
end
