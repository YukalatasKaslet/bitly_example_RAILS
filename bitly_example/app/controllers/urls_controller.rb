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
  def update
    @url = Url.find(params[:id])
    if @url.update_attributes(url_params)
      # Handle a successful update.
      #render 'show'
      redirect_to url_path
    else
      render 'edit'
      #redirect_to edit_url_path #de esta forma no muestra los errores que se habían guardado en el objeto
    end
  end

  #PUT /urls/:id

  #DELETE /urls/:id
  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to urls_path
  end

  def short_url
  #redirige a la Url original
  short_url = params[:short_url]
  url = Url.find_by(short_url: short_url)
    if url
      url.visits_count += 1
      url.save
      redirect_to( url.long_url )
    else
      @url = Url.new
      @url.errors.add(:short_url_are_invalid, "")
      flash[:error] = "*** La Url que ingresaste no es válida ***"
      render 'error'
    end
  end


 private
  def url_params
    params.require(:url).permit(:long_url)
  end

end#UrlsController
