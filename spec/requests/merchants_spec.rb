require 'rails_helper'

RSpec.describe 'Merchants API', type: :request do

	let!(:merchants) {create_list(:merchant, 40)}

	describe 'GET /api/v1/merchants' do
		before {get '/api/v1/merchants'}

		it 'returns 20 merchants at a time without query params' do
			expect(json).not_to be_empty
			expect(json.size).to eq(20)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /api/v1/merchants?per_page=40' do
		before {get '/api/v1/merchants?per_page=40'}

		it 'returns number of merchants based on query param' do
			expect(json).not_to be_empty
			expect(json.size).to eq(40)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /api/v1/merchants/1' do
		before {get "/api/v1/merchants/#{merchants.first.id}"}
		it 'returns 1 merchant' do
			expect(json).not_to be_empty
			expect(json["name"]).to eq(merchants.first.name)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end
end
