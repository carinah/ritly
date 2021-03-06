class Url < ActiveRecord::Base
  has_many :visits

   validates :link, presence: true
   validates :random_string, presence: true, length: { minimum: 6, maximum: 10 }
   validates_uniqueness_of :random_string



   def self.find_url(random_string)
    @url = find_by(random_string: [random_string])
    Url.find(@url.id)
    # where("my_string = ?" OR "random_string = ?", random_string_or_my_string).find
    # self declares that the method will be performed on the entire table, not a single row. 
    # Use self when defining a class method. 
  end 

   def self.redirect_counter(random_string)
      @url = find_by(random_string: [random_string]) 
      Url.increment_counter(:count, @url.id) 
    end 

    def self.redirect_counter_my_string(my_string)
      @url = find_by(my_string: [my_string]) 
      Url.increment_counter(:count, @url.id) 
    end 

     before_validation :ensure_url_has_http 
protected
  # this is a callback 
   def ensure_url_has_http 
      unless link.start_with?("http://", "https://")
        self.link = "http://" + self.link
        # self.link is the link itself as a variable 
      end 
    end 

end
