class UrlsController < ApplicationController
  
  #GET /urls
  def index
    @urls = Url.all
  end

  #POST /urls
  def create
    # p"*"*50
    # p params
    # p params[:url][:long_url]
    #@url = Url.new(long_url: params[:url][:long_url])
    #@url = Url.new(params[:url]) #esto no es seguro y manda a error por lo mismo
    @url = Url.new(url_params)
    if @url.save
      redirect_to @url
    else
      render :new #acción new
    end
  end

  #GET /urls/new
  def new
    @url = Url.new
  end

  #GET /urls/:id/edit
  def edit
    @url = Url.find(params[:id])
  end

  #GET /urls/:id
  def show
    @url = Url.find(params[:id])
  end

  #PATCH /urls/:id

  #PUT /urls/:id

  #DELETE /urls/:id
  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to urls_path
  end

 private
  def url_params
    params.require(:url).permit(:long_url)
  end

end#UrlsController
