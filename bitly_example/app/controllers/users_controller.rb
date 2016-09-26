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
    @user.password=(valid_user_params["password"])
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "El usuario se guardó correctamente"
      redirect_to profile_path
    else
      flash[:error] = "***El usuario no se guardó correctamente, vuelte a intentarlo***"
      redirect_to signup_path
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
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "El usuario se actualizó correctamente"
      redirect_to profile_path
      # Handle a successful update.
    else
      flash[:error] = "***El usuario no se guardó correctamente, vuelte a intentarlo***"
      #render 'edit'
      redirect_to edit_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

 private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end#UsersController