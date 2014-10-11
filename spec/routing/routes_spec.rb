describe 'Tok routes' do
  routes { Tok::Engine.routes }

  context "with default routes used" do
    it { expect(post: 'signup').to be_routable }
    it { expect(post: 'signup').to route_to(controller: "tok/users", action: "create") }
  end
end
