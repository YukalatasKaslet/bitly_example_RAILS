class UsersController < ApplicationController
  #Index
  def profile
    @user = User.find(session[:user_id])
  end

  #signup
  def create
    valid_user_params = user_params
     # p"*"*50
     # p valid_user_params
    @user = User.new(name: valid_user_params["name"], email: valid_user_params["email"])

    p password = valid_user_params["password"]
    p password_nil?(password)

    if !(password_nil?(password))
      @user.password=(password)
    else
      flash[:error] = ".:: El password no puede ir vacío ::."
      return redirect_to signup_path
    end
    
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = ".:: El usuario se guardó correctamente ::."
      redirect_to profile_path
    else
      message = ""
      if !(@user.errors.empty?)
        @user.errors.full_messages.each do |error_message|
          message += ".:: #{error_message} ::.&&&"
        end
        flash[:error] = message  
      end
      redirect_to signup_path
      #render 'new'
    end
  end

  def new
    @user = User.new
  end

  def edit
     @user = User.find(params[:id])
  end

  # def show
  # end

  def update
    valid_user_params = user_params

    if !(password_nil?(valid_user_params["password"]))
      @user = User.authenticate(valid_user_params["email"].downcase, valid_user_params["password"])
    else
      flash[:error] = ".:: El password no puede ir vacío ::."
      return redirect_to edit_user_path 
    end

    if @user.update_attributes(name: valid_user_params["name"])
        flash[:success] = ".:: El usuario se actualizó correctamente ::."
        redirect_to profile_path
        # Handle a successful update.
    else
      message = ""
      if !(@user.errors.empty?)
        @user.errors.full_messages.each do |error_message|
          message += ".:: #{error_message} ::.&&&"
        end
      flash[:error] = ".:: El usuario no se guardó, vuelte a intentarlo ::.&&&" + message  
    end
      redirect_to edit_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = ".:: El usuario se ha borrado correctamente ::."
    redirect_to root_path
  end

 private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def password_nil?(password)
    if password == ""
      true
    else
      false
    end
  end
end#UsersController