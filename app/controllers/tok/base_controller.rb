module Tok
  class BaseController < ApplicationController 
    include Tok::Controller

    private

    def resource_params
      params.require(resource_name.to_sym).permit(:email, :password)
    end
  end
end
