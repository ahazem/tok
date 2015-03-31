# Use the following configuration block to adjust Tok.
Tok.configure do |config|
  # -- Model --
  # If you used a model different than the already included `User` model, you
  # have to specify the name of the model over here.
  # Default: User
  #
  # config.model = 


  # -- Bcrypt Cost --
  # The cost factor for Bcrypt, defines how many rounds a password should be
  # hashed.
  # Default: 10
  #
  # config.bcrypt_cost = 
 

  # -- Signup Route --
  # The route to be used for handling creation of new users.
  # Default: `signup`
  #
  # config.signup_route = 


  # -- Login Route --
  # The route to be used for handling authentication.
  # Default: `login`
  #
  # config.login_route = 
  

  # -- Logout Route --
  # The route to be used for logging users out.
  # Default: `logout`
  #
  # config.logout_route = 
end
