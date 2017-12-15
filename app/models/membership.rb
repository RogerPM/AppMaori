class Membership < ActiveRecord::Base
  belongs_to :service


   def membership_rate_name
  self.name + ( (self.service != nil) ? ' ' + self.service.name : '' )
 end

  def service_name
	  if self.service
	   self.service.name
	  else
	   ''
	  end
 end
end
