module Tok
  class UsersController < BaseController
    # POST /signup
    def create
      @model = model_class.new(model_params)

      if @model.save
        render json: @model, status: :created
      else
        render json: @model.errors, status: :unprocessable_entity
      end
    end
  end
end
