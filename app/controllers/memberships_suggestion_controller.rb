class MembershipsSuggestionController < ApplicationController
	def index
		if params[:query].present?
			query = params[:query]
			condition1 = "unaccent(lower(memberships.rate_name)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			condition2 = condition1 + " OR unaccent(lower(service.name)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			@memberships = Membership.joins(:service).where(condition2)
			@memberships.each do |membership|
				membership.rate_name = membership.membership_name
			end
		end
		@memberships ||= membership.none

		render json: @memberships
	end
end