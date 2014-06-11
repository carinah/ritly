class Url < ActiveRecord::Base
   validates :link, presence: true
   validates :random_string, presence: true, length: { minimum: 6, maximum: 10 }

   def self.find_url(random_string)
    find_by(random_string: [random_string])
    # self declares that the method will be performed on the entire table, not a single row. 
    # Use self when defining a class method. 
  end 
end
