require 'rails_helper'

RSpec.describe 'Items API', type: :request do
	before :each do
		Faker::Name.unique.clear
	end
	# let!(:merchant) { create(:merchant) }
	let!(:items) {create_list(:item, 100)}

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

	describe 'GET /api/v1/items?page=4' do
		before {get '/api/v1/items?page=4'}

		it 'returns empty data array' do
			expect(json).not_to be_empty
			expect(json["data"].size).to eq(20)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /api/v1/items?per_page=10&page=4' do
		before {get '/api/v1/items?per_page=10&page=4'}

		it 'returns empty data array' do
			expect(json).not_to be_empty
			expect(json["data"].size).to eq(10)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end


	describe 'GET /api/v1/items/1' do
		before {get "/api/v1/items/#{items.first.id}"}
		it 'returns 1 item' do
			expect(json).not_to be_empty
			expect(json["data"]["id"].to_i).to eq(items.first.id)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /api/v1/items/1/merchant' do
		before {get "/api/v1/items/#{items.first.id}/merchant"}
		it 'returns info about items merchant' do
			expect(json).not_to be_empty
			expect(json["data"]["type"]).to eq("merchant")
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end


	describe 'POST /api/v1/items' do
		let(:valid_merchant) {items.first.merchant.id}
		let(:valid_attributes) {
			{
			  name: "new item",
			  description: "new description",
			  unit_price: 345.87,
			  merchant_id: valid_merchant
			}
		}
		before {post "/api/v1/items", params: valid_attributes}

		it 'returns status code 200' do
			expect(response).to have_http_status(201)
		end
	end

	describe 'DELETE /api/v1/items/1' do
		before {delete "/api/v1/items/#{items.first.id}"}

		it 'returns status code 200' do
			expect(response).to have_http_status(204)
		end
	end
	#happy path
	describe 'PUT /api/v1/items/1' do
		let(:valid_merchant) {items.last.merchant.id}
		let(:valid_attributes) {
			{
			  name: "new new item",
			  description: "new new description",
			  unit_price: 346.87,
			  merchant_id: valid_merchant
			}
		}
		before {post "/api/v1/items", params: valid_attributes}

		it 'returns status code 200' do
			expect(response).to have_http_status(201)
		end
	end

	#sad path
	describe 'PUT /api/v1/items/1' do
		let(:invalid_merchant) {9999999}
		let(:invalid_attributes) {
			{
			  name: "new new item",
			  description: "new new description",
			  unit_price: 346.87,
			  merchant_id: invalid_merchant
			}
		}
		# before {post "/api/v1/items", params: invalid_attributes}

		it 'raises an exception' do
			expect{
				put "/api/v1/items", params: invalid_attributes
			}.to raise_error(ActiveRecord::RecordNotFound)
		end
	end

	describe 'GET /api/v1/items/find_all' do
		before {get "/api/v1/items/find_all?name=#{items.first.name}"}
		it 'returns all items by name' do
			expect(json).not_to be_empty
			expect(json["data"]["id"].to_i).to eq(items.first.id)
			expect(json["data"]["attributes"]["name"]).to eq(items.first.name)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /api/v1/items/find_all?min_price=30' do
		let(:min) {30}
		before {get "/api/v1/items/find_all?min_price=#{min}"}
		it 'returns all items by min_price' do
			expect(json).not_to be_empty
			expect(json["data"].all? {|item|item["attributes"]["unit_price"]> min }).to eq(true)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /api/v1/items/find_all?max_price=30' do
		let(:max) {400}
		before {get "/api/v1/items/find_all?max_price=#{max}"}
		it 'returns all items by min_price' do
			expect(json).not_to be_empty
			expect(json["data"].all? {|item|item["attributes"]["unit_price"] < max }).to eq(true)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /api/v1/items/find_all?max_price=30' do
		let(:max) {400}
		let(:min) {150}
		before {get "/api/v1/items/find_all?max_price=#{max}&min_price=#{min}"}
		it 'returns all items by min_price and max_price' do
			expect(json).not_to be_empty
			expect(json["data"].all? {|item|item["attributes"]["unit_price"] < max && item["attributes"]["unit_price"] > min }).to eq(true)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

end
