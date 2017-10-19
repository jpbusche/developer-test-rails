class WebpagesController < ApplicationController
	before_action :set_webpage, only: [:show, :edit, :update, :destroy]
	before_action :logged_in?, except: [:show, :index]

	def new
		@webpage = Webpage.new
	end

	def edit
	end

	def show
	end

	def index
		@webpages = Webpage.all
	end

	def create
		webpage = Webpage.new(webpage_params)
		webpage.user_id = current_user.id
		if webpage.save
			flash[:success] = 'Página criada com sucesso'
			redirect_to webpage_path(webpage.id)
		else
			flash[:error] = 'Não foi possível criar a página'
			redirect_to new_webpage_path
		end
	end

	def update
		if @webpage.update(webpage_params)
			flash[:success] = 'Página editada com sucesso'
			redirect_to webpage_path(@webpage.id)
		else
			flash[:error] = 'Não foi possível editar a página'
			redirect_to edit_webpage_path
		end
	end

	def destroy
		if @webpage.user_id == current_user.id
			@webpage.destroy
	    	flash[:success] = 'Página deletada com sucesso'
	    	redirect_to root_path
	    else
	    	flash[:error] = 'Não foi possível deletar a página'
	    	redirect_to webpage_path(@webpage.id)
	    end
	end

	private

	def set_webpage
		@webpage = Webpage.find(params[:id])
	end

	def webpage_params
		params.require(:webpage).permit(:title, :description, :body, :url, :author, :logo)
	end

end