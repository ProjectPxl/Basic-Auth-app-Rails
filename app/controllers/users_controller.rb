class UsersController < ApplicationController
before_filter :save_login_state, :only => [:new, :create]
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)


  	if @user.save 
  		flash[:notice] = "Sign up, successful"
  	else
  		flash[:notice] = "Form Invalid."
  	end
  render "new"
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
  	
end
