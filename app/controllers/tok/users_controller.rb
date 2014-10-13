module Tok
  class UsersController < ApplicationController
    # POST /signup
    def create
      @resource = resource.new(resource_params)

      if @resource.save
        render json: @resource, status: :created
      else

      end
    end

    private

    def resource_params
      params.require(resource_name.to_sym).permit(:username, :password)
    end
  end
end
