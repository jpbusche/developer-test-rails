require 'rails_helper'
include SessionsHelper

RSpec.describe WebpagesController, type: :controller do

	describe 'Webpage new and create methods' do

		before(:each) do
      		@user = User.create(username: "RoDrIgO", email: "rodrigo@email.com", password: "12345678", password_confirmation: "12345678")
      		sign_in(@user)
		end

		it 'should return new view' do
			get :new
			expect(response).to have_http_status(200)
		end
		it 'should create a new webpage' do
			text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tempor finibus metus et porta. Morbi ullamcorper lacus porttitor hendrerit vehicula. Nulla elementum ex massa, ut imperdiet nunc congue nec."
			post :create, params:{webpage: {title: "Google", description: "Site de pesquisa", body: text, author: "Larry Page", url: "www.google.com.br"}}
			expect(flash[:success]).to eq('Página criada com sucesso')
			expect(Webpage.count).to be(1)
		end
		it 'should not create a new webpage' do
			post :create, params:{webpage: {title: "Google", description: "Site de pesquisa", body: nil, author: "Larry Page", url: "www.google.com.br"}}
			expect(flash[:error]).to eq('Não foi possível criar a página')
			expect(Webpage.count).to be(0)
		end
	end

	describe 'Webpage index and show methods' do

		before(:each) do
      		@user = User.create(username: "RoDrIgO", email: "rodrigo@email.com", password: "12345678", password_confirmation: "12345678")
      		sign_in(@user)
		end

		it 'should show a webpage' do
			text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tempor finibus metus et porta. Morbi ullamcorper lacus porttitor hendrerit vehicula. Nulla elementum ex massa, ut imperdiet nunc congue nec."
			post :create, params:{webpage: {title: "Google", description: "Site de pesquisa", body: text, author: "Larry Page", url: "www.google.com.br"}}
			get :show, params:{id: Webpage.first.id}
			expect(response).to have_http_status(200)
		end
		it 'should return index view' do
			get :index
			expect(response).to have_http_status(200)
		end
	end

	describe 'Webpage edit and update methods' do

		before(:each) do
			text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tempor finibus metus et porta. Morbi ullamcorper lacus porttitor hendrerit vehicula. Nulla elementum ex massa, ut imperdiet nunc congue nec."
      		@user = User.create(username: "RoDrIgO", email: "rodrigo@email.com", password: "12345678", password_confirmation: "12345678")
      		sign_in(@user)
      		post :create, params:{webpage: {title: "Google", description: "Site de pesquisa", body: text, author: "Larry Page", url: "www.google.com.br"}}
		end

		it 'should return edit view' do
			get :edit, params:{id: Webpage.first.id}
			expect(response).to have_http_status(200)
		end
		it 'should update the webpage' do
			get :update, params:{id: Webpage.first.id, webpage: {title: "Google", description: "Search Site", body: "conteudo do site", author: "Larry Page", url: "www.google.com.br"}}
			expect(flash[:success]).to eq('Página editada com sucesso')
		end
		it 'should not update the webpage' do
			get :update, params:{id: Webpage.first.id, webpage: {title: "Google", description: nil, body: nil, author: "Larry Page", url: "www.google.com.br"}}
			expect(flash[:error]).to eq('Não foi possível editar a página')
		end
	end

	describe 'Webpage destroy method' do
		before(:each) do
			text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tempor finibus metus et porta. Morbi ullamcorper lacus porttitor hendrerit vehicula. Nulla elementum ex massa, ut imperdiet nunc congue nec."
      		@user = User.create(username: "RoDrIgO", email: "rodrigo@email.com", password: "12345678", password_confirmation: "12345678")
      		@user_2 = User.create(username: "Busche", email: "busche@email.com", password: "12345678", password_confirmation: "12345678")
      		sign_in(@user)
      		post :create, params:{webpage: {title: "Google", description: "Site de pesquisa", body: text, author: "Larry Page", url: "www.google.com.br"}}
		end

		it 'should delete the webpage' do
			get :destroy, params:{id: Webpage.first.id}
			expect(flash[:success]).to eq('Página deletada com sucesso')
			expect(Webpage.count).to be(0)
		end
	end
end