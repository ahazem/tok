module Tok
  class SessionsController < BaseController
    # POST /login
    def create
      @user = resource_class.authenticate(resource_params)

      if @user
        render json: @user, status: :created
      end
    end

    private

    def resource_params
      params.require(resource_name.to_sym).permit(:email, :password)
    end
  end
end
