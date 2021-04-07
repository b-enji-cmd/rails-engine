require 'rails_helper'

RSpec.describe 'Merchants API', type: :request do
	before :each do
		Faker::Name.unique.clear
	end

	let!(:merchants) {create_list(:merchant, 100)}

	describe 'GET /api/v1/merchants' do
		before {get '/api/v1/merchants'}

		it 'returns 20 merchants at a time without query params' do
			expect(json).not_to be_empty
			expect(json["data"].size).to eq(20)
		end


		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end


	describe 'GET /api/v1/merchants?per_page=40' do
		before {get '/api/v1/merchants?per_page=40'}

		it 'returns maximum of 20 merchants' do
			expect(json).not_to be_empty
			expect(json["data"].size).to eq(40)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /api/v1/merchants?page=4' do
		before {get '/api/v1/merchants?page=4'}

		it 'returns empty data array' do
			expect(json).not_to be_empty
			expect(json["data"].size).to eq(20)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /api/v1/merchants?per_page=10&page=4' do
		before {get '/api/v1/merchants?per_page=10&page=4'}

		it 'returns empty data array' do
			expect(json).not_to be_empty
			expect(json["data"].size).to eq(10)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /api/v1/merchants/1' do
		before {get "/api/v1/merchants/#{merchants.first.id}"}
		it 'returns 1 merchant' do
			expect(json).not_to be_empty
			expect(json["data"]["id"].to_i).to eq(merchants.first.id)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end



	describe 'GET /api/v1/merchants/1/items' do
			let!(:merchant) { create(:merchant) }
			let!(:items) {create_list(:item, 5, merchant_id: merchant.id)}
			let(:merchant_id) {merchant.id}
			let(:item_id) {items.first.id}
			before { get "/api/v1/merchants/#{merchant_id}/items" }

		it 'returns 1 merchants items' do
			expect(json).not_to be_empty
			expect(json["data"].first["id"].to_i).to eq(item_id)
			expect(json["data"].first["attributes"]["merchant_id"].to_i).to eq(merchant.id)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /api/v1/merchants/find?name=x' do
		before {get "/api/v1/merchants/find", params: {name: "#{merchants.first.name}"}}
		it 'returns 1 merchant by query' do
			expect(json).not_to be_empty
			expect(json["data"]["attributes"]["name"]).to eq(merchants.first.name)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

end
