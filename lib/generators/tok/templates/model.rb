class <%= model_name.classify %> < ActiveRecord::Base
  include Tok::Authentication
end
