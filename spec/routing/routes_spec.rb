describe 'Tok routes' do
  context "with default routes used" do
    describe "/signup" do
      it { expect(post: 'signup').to be_routable }
      it { expect(post: 'signup').to route_to(controller: "tok/users", action: "create") }
    end

    describe "/login" do
      it { expect(post: 'login').to be_routable }
      it { expect(post: 'login').to route_to(controller: "tok/sessions", action: "create") }
    end

    describe "/logout" do
      it { expect(delete: '/logout').to be_routable }
      it { expect(delete: '/logout').to route_to(controller: "tok/sessions", action: "destroy") }
    end
  end

  context "with different route for /signup" do
    before do
      Tok.configure do |config|
        config.signup_route = "register"
      end

      Rails.application.routes_reloader.reload!
    end

    it { expect(post: 'register').to be_routable }
    it { expect(post: 'register').to route_to(controller: "tok/users", action: "create") }
  end

  context "with different route for /login" do
    before do
      Tok.configure do |config|
        config.login_route = "signin"
      end

      Rails.application.routes_reloader.reload!
    end

    it { expect(post: 'signin').to be_routable }
    it { expect(post: 'signin').to route_to(controller: "tok/sessions", action: "create") }
  end

  context "with different route for /logout" do
    before do
      Tok.configure do |config|
        config.logout_route = "signout"
      end

      Rails.application.routes_reloader.reload!
    end

    it { expect(delete: 'signout').to be_routable }
    it { expect(delete: 'signout').to route_to(controller: "tok/sessions", action: "destroy") }
  end
end
