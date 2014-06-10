class UrlsController < ApplicationController

  def new 
  end 

  def create
    url = params[:url]
    Url.create(url)
    # random_string = SecureRandom.urlsafe_base64(length_of_string).8 
    redirect_to "/urls"
  end 

  def show 
  end 
end
