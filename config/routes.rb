Rails.application.routes.draw do
  post "signup", to: "tok/users#create"
  post "login", to: "tok/sessions#create"
end
