class SessionsController < ApplicationController
	def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      @user_id = current_user.id
      person = Person.find_by(user_id: @user_id)
     
      redirect_to person_path(person) #user_path(user.id)#, #:notice => "Logged in!"

    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end

