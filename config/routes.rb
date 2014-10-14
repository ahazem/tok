Rails.application.routes.draw do
  post "signup", to: "tok/users#create"
end
