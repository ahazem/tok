module Tok
  class UsersController < BaseController
    # POST /signup
    def create
      @resource = resource_class.new(resource_params)

      if @resource.save
        render json: @resource, status: :created
      else
        render json: @resource.errors, status: :unprocessable_entity
      end
    end
  end
end
