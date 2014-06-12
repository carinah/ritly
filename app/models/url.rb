class Url < ActiveRecord::Base
   validates :link, presence: true
   validates :random_string, presence: true, length: { minimum: 6, maximum: 10 }



   def self.find_url(random_string)
    find_by(random_string: [random_string])
    # self declares that the method will be performed on the entire table, not a single row. 
    # Use self when defining a class method. 
  end 

  def self.find_url_by_my_string(my_string)
    find_by(my_string: [my_string])
  end 

   def self.redirect_counter(random_string)
      @url = find_by(random_string: [random_string]) 
      Url.increment_counter(:count, @url.id) 
    end 

    def self.redirect_counter_my_string(my_string)
      @url = find_by(my_string: [my_string]) 
      Url.increment_counter(:count, @url.id) 
    end 


  def self.parse(url)
    doc = Nokogiri::HTML(open(url))
    page_info = {}
    page_info[:link] = doc.css('title').text
    return page_info
  end
end

    # How can you find_by more than 1 attribute? Url.find_or_create_by_random_string_and_my_string(random, my)? 
   

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
