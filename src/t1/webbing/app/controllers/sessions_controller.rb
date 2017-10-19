class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Login realizado com sucesso'
  		sign_in(user)
  		redirect_to root_path
  	else
      flash[:error] = 'Email ou senha incorretos'
  		redirect_to login_path
  	end
  end

  def destroy
    sign_out
  	redirect_to root_path
  end

end