require 'rails_helper'

RSpec.describe 'Merchants API', type: :request do
	let!(:merchants) {create_list(:merchant, 20)}

	describe 'GET /api/v1/merchants' do
		before {get '/api/v1/merchants'}

		it 'returns merchants' do
			expect(json).not_to be_empty
			expect(json.size).to eq(20)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end


	end
end
