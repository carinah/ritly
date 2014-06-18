class Visit < ActiveRecord::Base
  belongs_to :url 
  
  def self.find_ip_address
    request.remote_ip 
  end 
end
  

