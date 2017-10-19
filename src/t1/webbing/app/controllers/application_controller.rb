class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def sign_in(user)
  	session[:user_id] = user.id
    current_user
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    return unless current_user.nil
    flash[:notice] = 'Você precisa estar logado'
    redirect_to root_path
  end
end
