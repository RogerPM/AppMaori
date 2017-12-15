class ProvidersSuggestionController < ApplicationController
 def index
  if params[:query].present?
   query = params[:query]
   condition = "unaccent(lower(name)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
   @providers = Provider.where(condition)
  end
  @providers ||= Provider.none

  render json: @providers
 end
end