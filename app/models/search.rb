class Search
  def initialize(page, page_size, keywords, current_user = nil)
    @page = page
    @page_size = page_size
    @offset = page_size * page
    @keywords = keywords
    @current_user = current_user
  end


 def providers_by_name
  if @keywords.present?
   providers = Provider.where(name_condition).order(:name).offset(@offset).limit(@page_size)
   @number_of_records = Provider.where(name_condition).count
  else
   providers = Provider.order(:name).offset(@offset).limit(@page_size)
   @number_of_records = Provider.count
  end
 
  return providers, number_of_pages
 end


  def products_by_name
    if @keywords.present?
        products = Product.where(name_condition).order(:name).offset(@offset).limit(@page_size)
        @number_of_records = Product.where(name_condition).count
      else
        products = Product.order(:name).offset(@offset).limit(@page_size)
        @number_of_records = Product.count
      end
      
      return products, number_of_pages
  end

  def users_by_name
    if @keywords.present?
        users = User.where(name_condition).order(:name).offset(@offset).limit(@page_size)
        @number_of_records = User.where(name_condition).count
      else
        users = User.order(:name).offset(@offset).limit(@page_size)
        @number_of_records = User.count
      end
      
      return users, number_of_pages
  end

  def services_by_name
    if @keywords.present?
        services = Service.where(name_condition).order(:name).offset(@offset).limit(@page_size)
        @number_of_records = Service.where(name_condition).count
      else
        services = Service.order(:name).offset(@offset).limit(@page_size)
        @number_of_records = Service.count
      end
      
      return services, number_of_pages
  end

  def clients_by_name
    if @keywords.present?
        clients = Client.where(name_condition).order(:name).offset(@offset).limit(@page_size)
        @number_of_records = Client.where(name_condition).count
      else
        clients = Client.order(:name).offset(@offset).limit(@page_size)
        @number_of_records = Client.count
      end
      
      return clients, number_of_pages
  end

  def memberships_by_rate_name
    if @keywords.present?
        memberships = Membership.where(rate_name_condition).order(:rate_name).offset(@offset).limit(@page_size)
        @number_of_records = Membership.where(rate_name_condition).count
      else
        memberships = Membership.order(:rate_name).offset(@offset).limit(@page_size)
        @number_of_records = Membership.count
      end
      
      return memberships, number_of_pages
  end

  def sales
    if @keywords.present?
        sales = Sale.where(sale_condition).order(number: :desc).offset(@offset).limit(@page_size)
        @number_of_records = Item.where(description_condition).count
      else
        sales = Sale.where(state: "confirmed").order(number: :desc).offset(@offset).limit(@page_size)
      @number_of_records = Sale.where(state: "confirmed").count
      end

    return sales, number_of_pages
  end


  private

  def name_condition
    name_condition = "unaccent(lower(name)) LIKE '%#{I18n.transliterate(@keywords.downcase)}%'"
  end

  def rate_name_condition
    rate_name_condition = "unaccent(lower(rate_name)) LIKE '%#{I18n.transliterate(@keywords.downcase)}%'"
  end

  def description_condition
    description_condition = "unaccent(lower(description)) LIKE '%#{I18n.transliterate(@keywords.downcase)}%'"
  end

  def sale_condition
    number_condition = "number = #{@keywords.to_i} and user_id = #{@current_user.id} and state = 1"
  end

  def number_of_pages
    number_of_pages = (@number_of_records % @page_size) == 0 ? 
                          @number_of_records / @page_size - 1 : @number_of_records / @page_size
  end
end