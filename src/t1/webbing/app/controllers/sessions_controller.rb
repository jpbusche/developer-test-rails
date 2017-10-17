class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		session[:user_id] = user.id
  		redirect_to user_path(user.id)
  	else
  		redirect_to root_path
  	end
  end

  def destroy
  	if current_user
  		session[:user_ir] = nil
  	end
  	redirect_to root_path
  end

end