class UsersSuggestionController < ApplicationController
	def index
		if params[:query].present?
			query = params[:query]
			condition1 = "unaccent(lower(users.namen)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			condition2 = condition1 + " OR unaccent(lower(users.last_name)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			@users = user.joins(:provider).where(condition2)
			@users.each do |user|
				user.name = user.user_name
			end
		end
		@users ||= User.none

		render json: @users
	end
end