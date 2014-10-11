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

    def resource
      Tok.configuration.resource
    end

    def resource_name
      resource.to_s.downcase
    end

    def resource_class
      resource.constantize
    end

    def resource_params
      params.require(resource_name.to_sym).permit(:username, :password)
    end
  end
end
