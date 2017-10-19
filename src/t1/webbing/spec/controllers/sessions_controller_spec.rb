require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
	describe 'Test methods of Controller Session' do

    	before(:each) do
      		@user = User.create(username: "RoDrIgO", email: "rodrigo@email.com", password: "12345678", password_confirmation: "12345678")
		end

		it 'should return new session' do
	        get :new
	        expect(response).to be_success
	        expect(response).to have_http_status(200)
	  	end
		it 'should create a session with corrects arguments' do
	      	post :create ,params: {session: {email: 'rodrigo@email.com',password: '12345678'}}
	      	expect(session[:user_id]).to eq(@user.id)
	      	expect(flash[:success]).to eq('Login realizado com sucesso')
		end
		it 'should not create a session with wrong arguments' do
	      	post :create ,params: {session: {email: 'rodrigo@email.com',password: 'qwertyuiop'}}
	      	expect(flash[:error]).to eq('Email ou senha incorretos')
		end
		it 'should destroy a session and redirect to root_url' do
	      	post :create ,params: {session: {email: 'rodrigo@email.com',password: '12345678'}}
	      	get :destroy
	      	expect(session[:user_id]).to eq(nil)
	      	expect(@current_user).to eq(nil)
	      	expect(response).to redirect_to(root_url)
		end

	end
end