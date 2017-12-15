class Product < ActiveRecord::Base
  belongs_to :provider
  

  validates :name, presence: true

 def product_name
  self.name + ( (self.provider != nil) ? ' ' + self.provider.name : '' )
 end

  def provider_name
	  if self.provider
	   self.provider.name
	  else
	   ''
	  end
 end

end
