class UrlsController < ApplicationController

  def new 
  end 

  def create
    redirect_to "/urls"
  end 
end
