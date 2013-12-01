class SessionsController < ApplicationController

	before_filter :authenticate_user, :only => [:home, :profile, :settings]
	before_filter :save_login_state, :only => [:login, :index]

	  def index
	    #Login Form
	  end	

	  def login
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
	    if authorized_user
	   		session[:user_id] = authorized_user.id
	      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
	      redirect_to(:action => 'home')
	    else
	      flash[:notice] = "Invalid Username or Password"
	      render "index"	
	    end
	  end

	  def settings
	  	
	  end

	  def logout
	  session[:user_id] = nil
	  redirect_to :action => 'index'
		end
end
