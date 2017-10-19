require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	describe 'User new and create methods' do

		it 'should return new view' do
			get :new
			expect(response).to have_http_status(200)
		end
		it 'should create a new user' do
			post :create, params:{user: {username: "RoDrIgO", email: "rodrigo@email.com", password: "12345678", password_confirmation: "12345678"}}
			expect(flash[:success]).to eq('Usuário criado com sucesso')
			expect(User.count).to be(1)
		end
		it 'shoudl not create a new user' do
			post :create, params:{user: {username: "RoDrIgO", email: "rodrigo@email.com", password: "12345678", password_confirmation: "61656678"}}
			expect(flash[:error]).to eq('Não foi possível criar o usuário')
			expect(User.count).to be(0)
		end
	end

	describe 'User show and delete methods' do

		it 'shoudl show a user' do
			post :create, params:{user: {username: "RoDrIgO", email: "rodrigo@email.com", password: "12345678", password_confirmation: "12345678"}}
			get :show, params:{id: User.first.id}
			expect(response).to have_http_status(200)
		end	

	end

end
