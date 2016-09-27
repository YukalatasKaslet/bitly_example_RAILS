class SessionsController < ApplicationController
  def new
  end

  def create
    user = params[:session]
    user = User.authenticate(user["email"].downcase, user["password"])
    if user != nil 
      session[:user_id] = user.id
      flash[:success] = ".:: Sesión Iniciada con éxito ::."
      redirect_to profile_path
    else
      flash[:error] = ".:: UPS no se encontró al usuario ::."
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:success] = ".:: Sesión finalizada ::."
    redirect_to root_path
  end
end
