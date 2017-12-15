class ValidateSuggestedUserController < ApplicationController
 def index
  User = []
  if params[:user_name].present?
   user_name = params[:user_name]
   condition = "unaccent(lower(name)) = '#{I18n.transliterate(user_name.downcase)}'"
   user = User.where(condition)
  end
  if !user.empty?
   result = [valid: true, id: user.ids]
  else
   result = [valid: false, id: 0]
  end
  render json: result
 end
end