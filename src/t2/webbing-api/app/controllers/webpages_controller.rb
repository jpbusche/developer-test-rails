class WebpagesController < ApplicationController
	before_action :set_webpage, only: [:show, :update, :destroy]

	def index
	  @webpages = Webpage.all
	  json_response(@webpages)
	end

	def create
	  @webpage = Webpage.create!(webpage_params)
	  json_response(@webpage, :created)
	end

	def show
	  json_response(@webpage)
	end

	def update
	  @webpage.update(webpage_params)
	  head :no_content
	end

	def destroy
	  @webpage.destroy
	  head :no_content
	end

	private

	def webpage_params
	  params.permit(:title, :description, :body, :author, :url)
	end

	def set_webpage
	  @webpage = Webpage.find(params[:id])
	end
end
