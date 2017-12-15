class ValidateSuggestedMembershipController < ApplicationController
  def index
  		Membership = []
		if params[:membership_rate_name].present?
			membership_rate_name = params[:membership_rate_name]
			condition = "unaccent(lower(name || ' ' || name)) = '#{I18n.transliterate(membership_rate_name.downcase)}'"
			membership = membership.joins(:service).where(condition)
		end
		if !membership.empty?
			result = [valid: true, id: membership.first.id, price: membership.first.price]
		else
			result = [valid: false, id: 0]
		end
		render json: result
  end
end