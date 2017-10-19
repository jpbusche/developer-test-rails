module SessionsHelper

	def sign_in(user)
	  	session[:user_id] = user.id
	end

	def sign_out
	    session.delete(:user_id)
	    @current_user = nil
	end

	def current_user
	    @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def logged_in?
	    redirect_to login_path unless current_user
	end

end
