class UsersController < ApplicationController
  #Index
  def profile
    @user = User.find(session[:user_id])
  end

  #create
  def signup
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
      flash[:error] = "***El usuario no sé guardo correctamente, vuelte a intentarlo***"
      redirect_to new_user_path
    end
  end


  def login
  end

  def logout
  end

  def new
    @user = User.new
  end

  def edit
  end

  # def show
  # end

  def update
  end

  def destroy
  end

 private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end#UsersController