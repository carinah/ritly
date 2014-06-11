class UrlsController < ApplicationController

  def new 
  end 

  def create
    url = params[:url].permit(:link, :random_string)

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
  end 

  def edit 
    url_id = params[:id]
    @url = Url.find(url_id)
  end 

  def update 
    url_id = params[:id]
    @url = Url.find(url_id) 

    updated_url = params.require(:url).permit(:link, :random_string) 
    @url.update_attributes(updated_url)

    redirect_to "/urls/#{url_id}"
  end 

  def index 
    @urls = Url.all
  end 

  def random_string 
    random_string = params[:random_string] 

    if Url.find_url(random_string)
      Url.find_url(random_string).link 
    else 
      render file: "/Users/carinaho/Development/ritly/public/404.html"
    end

  end 



end
