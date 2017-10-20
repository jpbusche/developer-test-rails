require 'rails_helper'

RSpec.describe 'Webpages API', type: :request do
	before(:each) do
		text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis tempor finibus metus et porta. Morbi ullamcorper lacus porttitor hendrerit vehicula. Nulla elementum ex massa, ut imperdiet nunc congue nec."
		@webpage1 = Webpage.create(title: "Google", description: "Site de pesquisa", body: text, author: "Larry Page", url: "www.google.com.br")
		@webpage2 = Webpage.create(title: "Facebook", description: "Rede Social", body: text, author: "Mark Zuckerberg", url: "facebook.com")
		@webpage3 = Webpage.create(title: "Orkut", description: "Rede Social", body: text, author: "Orkut Büyükkökten", url: "www.orkut.com.br")
		@webpages = Webpage.all
	end
	let(:webpages) { @webpages }
	let(:webpage_id) { webpages.first.id }

	describe 'GET /webpages' do
	    before { get '/webpages' }

	    it 'returns webpages' do
	      expect(json).not_to be_empty
	    end
	    it 'returns status code 200' do
	      expect(response).to have_http_status(200)
	    end
  	end

  	describe 'GET /webpages/:id' do
	    before { get "/webpages/#{webpage_id}" }

	    context 'when the record exists' do
	      it 'returns the webpage' do
	        expect(json).not_to be_empty
	        expect(json['id']).to eq(webpage_id)
	      end
	      it 'returns status code 200' do
	        expect(response).to have_http_status(200)
	      end
	    end

	    context 'when the record does not exist' do
	      let(:webpage_id) { 100 }

	      it 'returns status code 404' do
	        expect(response).to have_http_status(404)
	      end
	      it 'returns a not found message' do
	        expect(response.body).to match("{\"message\":\"Couldn't find Webpage with 'id'=100\"}")
	      end
	    end
  	end

  	describe 'POST /webpages' do

	    context 'when the request is valid' do
	      before { post '/webpages', params: { title: "Bing", description: "Site de pesquisa", body: "Lorem impsu", author: "Steve Ballmer", url: "www.bing.com" } }

	      it 'creates a webpage' do
	        expect(json['title']).to eq("Bing")
	      end
	      it 'returns status code 201' do
	        expect(response).to have_http_status(201)
	      end
	    end

	    context 'when the request is invalid' do
	      before { post '/webpages', params: { title: 'Foobar' } }

	      it 'returns status code 422' do
	        expect(response).to have_http_status(422)
	      end
	      it 'returns a validation failure message' do
	        expect(response.body)
	          .to match(/Validation failed: Description can't be blank/)
	      end
	    end
  	end

  	describe 'PUT /webpages/:id' do
	    let(:valid_attributes) { { title: 'Google Images' } }

	    context 'when the record exists' do
	      before { put "/webpages/#{webpage_id}", params: valid_attributes }

	      it 'updates the record' do
	        expect(response.body).to be_empty
	      end
	      it 'returns status code 204' do
	        expect(response).to have_http_status(204)
	      end
	    end
  	end

  	describe 'DELETE /webpages/:id' do
	    before { delete "/webpages/#{webpage_id}" }

	    it 'returns status code 204' do
	      expect(response).to have_http_status(204)
	    end
  	end
end