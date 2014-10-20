module Tok
  class UsersController < BaseController
    # POST /signup
    def create
      @resource = resource_class.new(resource_params)

      if @resource.save
        render json: @resource, status: :created
      else

      end
    end

    private

    def resource_params
      params.require(resource_name.to_sym).permit(:email, :password)
    end
  end
end
