class ValidateSuggestedProductController < ApplicationController
  def index
  		Product = []
		if params[:product_name].present?
			product_name = params[:product_name]
			condition = "unaccent(lower(name || ' ' || name)) = '#{I18n.transliterate(product_name.downcase)}'"
			product = product.joins(:provider).where(condition)
		end
		if !product.empty?
			result = [valid: true, id: product.first.id, sale_price: product.first.sale_price]
		else
			result = [valid: false, id: 0]
		end
		render json: result
  end
end