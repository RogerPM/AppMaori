class ProductsSuggestionController < ApplicationController
	def index
		if params[:query].present?
			query = params[:query]
			condition1 = "unaccent(lower(products.namen)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			condition2 = condition1 + " OR unaccent(lower(providers.name)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			@products = Product.joins(:provider).where(condition2)
			@products.each do |product|
				product.name = product.product_name
			end
		end
		@products ||= Product.none

		render json: @products
	end
end