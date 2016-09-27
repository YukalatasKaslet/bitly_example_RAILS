class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  #helper_method ayuda a que tanto las vistas como los controladores puedan hacer uso del helper, de lo contrario solo las vistas podrían usarlo.
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  def logged_in?#TRUE if user session exist
    !current_user.nil?
  end

    
  #Otra forma de hacer los helpers
    # def current_user
    #   @current_user ||= User.find_by_id(session[:user])
    # end

    #  def logged_in?
    #    current_user != nil
    #  end
end#ApplicationController
