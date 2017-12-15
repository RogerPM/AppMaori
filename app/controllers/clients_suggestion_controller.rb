class ClientsSuggestionController < ApplicationController
	def index
		if params[:query].present?
			query = params[:query]
			condition1 = "unaccent(lower(clients.namen)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			condition2 = condition1 + " OR unaccent(lower(clients.last_name)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			@clients = client.joins(:provider).where(condition2)
			@clients.each do |client|
				client.name = client.client_name
			end
		end
		@clients ||= Client.none

		render json: @clients
	end
end