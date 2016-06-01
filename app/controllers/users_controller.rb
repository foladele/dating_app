class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_person_path 
    else
      render "new"
    end
  end

  def show
    @user= User.find(params[:id])
  end

  def destroy
     @user= User.find(params[:id]).destroy
     redirect_to root_path
  end

  private
  # Strong Parameters 
    def user_params
        params.require(:user).permit(:username, :email, :password,
         :password_confirmation)
    end
end