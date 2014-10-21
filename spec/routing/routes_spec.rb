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
  end
end
