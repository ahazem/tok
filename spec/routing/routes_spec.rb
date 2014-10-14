describe 'Tok routes' do
  context "with default routes used" do
    it { expect(post: 'signup').to be_routable }
    it { expect(post: 'signup').to route_to(controller: "tok/users", action: "create") }
  end
end
