class UrlsController < ApplicationController

  def new 
  end 

  def create
    url = params[:url].permit(:link, :random_string, :my_string)

    new_url = Url.create(url)
    new_url.random_string = SecureRandom.urlsafe_base64(5, true)
    new_url.save
    redirect_to url_path(new_url)
  end 

  def index 
    @urls = Url.all 
  end 

  def show 
    url = params[:id]
    @new_url = Url.find(url)
    @count = @new_url.count 

    # For showing timestamps of each visit. 
    @visits = @new_url.visits

  end 

  def edit 
    url_id = params[:id]
    @url = Url.find(url_id)
  end 

  def update 
    url_id = params[:id]
    @url = Url.find(url_id) 

    updated_url = params.require(:url).permit(:link, :random_string, :my_string) 
    @url.update_attributes(updated_url)

    redirect_to "/urls/#{url_id}"
  end 

  def index 
    @urls = Url.all
  end 

  def random_string 

    # matching_url = {}

    # if params[:random_string]
    #   matching_url = Url.find_url(params[:random_string])
    #   Url.redirect_counter(random_string)
    #   redirect_to matching_url.link 
    # elsif
    #   matching_url = Url.find_url(params[:my_string])
    #   Url.redirect_counter(random_string)
    #   redirect_to matching_url.link 
    # else 
    #   render file: "/Users/carinaho/Development/ritly/public/404.html"
    # end 
    random_string = params[:random_string] 
    matching_url = Url.find_url(random_string)

    if matching_url 
      # matching_url.build_visit ?? Returns undefined method 
      matching_url.visits.create(ip_address: request.remote_ip )
        
        Url.redirect_counter(random_string)
       redirect_to matching_url.link 
     else 
      
     end

  end 
    
end
