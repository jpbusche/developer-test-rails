class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		user = User.new(user_params)
		if user.save
			flash[:success] = 'Usuário criado com sucesso'
			sign_in(user)
			redirect_to user_path(user.id)
		else
			flash[:error] = 'Não foi possível criar o usuário'
			redirect_to new_user_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
	end

end
