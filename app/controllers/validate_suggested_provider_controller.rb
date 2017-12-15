class ValidateSuggestedProviderController < ApplicationController
  def index
  		Provider = []
		if params[:provider_name].present?
			provider_name = params[:provider_name]
			condition = "unaccent(lower(name || ' ' || name)) = '#{I18n.transliterate(provider_name.downcase)}'"
			provider = provider.joins(:provider).where(condition)
		end
		if !provider.empty?
			result = [valid: true, id: provider.first.id, sale_price: provider.first.sale_price]
		else
			result = [valid: false, id: 0]
		end
		render json: result
  end
end