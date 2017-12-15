class ServicesSuggestionController < ApplicationController
 def index
  if params[:query].present?
   query = params[:query]
   condition = "unaccent(lower(name)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
   @services = Service.where(condition)
  end
  @services ||= Service.none

  render json: @services
 end
end