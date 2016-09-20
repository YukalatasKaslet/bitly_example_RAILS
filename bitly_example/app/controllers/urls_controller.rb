class UrlsController < ApplicationController
  #GET /urls
  def index
    @urls = Url.all
  end

  #GET /urls/:id
  def show
    @url = Url.find(params[:id])
  end

  #GET /urls/new
  def new
    @url = Url.new
  end

  #POST /urls
  def create
    # p"*"*50
    # p params
    # p params[:url][:long_url]
    @url = Url.new(long_url: params[:url][:long_url])
    if @url.save
      redirect_to @url
    else
      render :new #acción new
    end
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to urls_path
  end

end#UrlsController
