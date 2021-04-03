require 'rails_helper'

RSpec.describe 'Items API', type: :request do

	let!(:items) {create_list(:item, 40)}

	describe 'GET /api/v1/items' do
		before {get '/api/v1/items'}

		it 'returns 20 items at a time without query params' do
			expect(json).not_to be_empty
			expect(json["data"].size).to eq(20)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /api/v1/items?per_page=40' do
		before {get '/api/v1/items?per_page=40'}

		it 'returns maximum of 20 items' do
			expect(json).not_to be_empty
			expect(json["data"].size).to eq(40)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /api/v1/items/1' do
		before {get "/api/v1/items/#{items.first.id}"}
		it 'returns 1 merchant' do
			expect(json).not_to be_empty
			expect(json["data"]["id"].to_i).to eq(items.first.id)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end
end
