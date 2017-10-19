class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def new
		@user = User.new
	end

	def edit
	end

	def show
	end

	def create
		user = User.new(user_params)
		if user.save
			flash[:success] = 'Usuário criado com sucesso'
			sign_in(user)
			redirect_to root_path
		else
			flash[:error] = 'Não foi possível criar o usuário'
			redirect_to new_user_path
		end
	end

	def update
		if @user.update(user_params) 
			flash[:success] = 'Usuário editado com sucesso'
			redirect_to user_path(@user.id)
		else
			flash[:error] = 'Não foi possível editar o usuário'
			redirect_to edit_user_path
		end
	end

	def destroy
		@user.destroy
    	flash[:success] = 'Usuário deletado com sucesso'
    	redirect_to root_path
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
	end

end
