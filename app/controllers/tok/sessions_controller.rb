module Tok
  class SessionsController < BaseController
    # POST /login
    def create
      @user = resource_class.authenticate(resource_params)

      if @user
        render json: @user, status: :created
      else
        render json: {"error" => "Invalid email or password!"}.to_json, status: :unprocessable_entity 
      end
    end

    # DELETE /logout
    def destroy
      current_user.reset_authentication_token if current_user

      head :no_content
    end
  end
end
