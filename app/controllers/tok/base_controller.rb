module Tok
  class BaseController < ApplicationController 
    include Tok::Controller

    private

    def model_params 
      params.require(model_name.to_sym).permit(:email, :password)
    end
  end
end
