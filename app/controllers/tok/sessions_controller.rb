module Tok
  class SessionsController < BaseController
    # POST /login
    def create
      @model = model_class.authenticate(model_params)

      if @model
        render json: {token: @model.authentication_token}.to_json, status: :created
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
