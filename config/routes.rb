Rails.application.routes.draw do
  post   "#{Tok.configuration.signup_route}", to: "tok/users#create"
  post   "#{Tok.configuration.login_route}",  to: "tok/sessions#create"
  delete "#{Tok.configuration.logout_route}", to: "tok/sessions#destroy" 
end
