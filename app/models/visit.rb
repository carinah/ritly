class Visit < ActiveRecord::Base
  belongs_to :url 

  def self.create
    visit = params[:url_id].permit(:count)
    new_visit = Visit.create(visit)
    @created_at = new_visit.created_at 
  end 

  
end
