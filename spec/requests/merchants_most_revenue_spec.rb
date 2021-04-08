require "rails_helper"

RSpec.describe 'Merchants Revenue Most Revenue API', type: :request do
	before :each do
    setup_five_merchants_revenue
  end
	describe 'GET api/v1/revenue/merchants' do
		before {get "/api/v1/revenue/merchants?quantity=1"}

		it "returns 1 merchant" do
			expect(json["data"].class).to eq Array
			expect(json["data"].length).to eq 1
			expect(json["data"].first["type"]).to eq "merchant_name_revenue"
		end
	end

	describe 'GET /api/v1/revenue/merchants?quantity=-1' do
		before {get "/api/v1/revenue/merchants?quantity=-1"}

		it "returns a 404" do
			expect(json["data"].empty?).to eq true
			expect(json["error"].present?).to eq true
		end
	end

	describe 'GET /api/v1/revenue/merchants?quantity=' do
		before {get "/api/v1/revenue/merchants?quantity="}

		it "returns a 404" do
			expect(json["data"].empty?).to eq true
			expect(json["error"].present?).to eq true
		end
	end

	describe 'GET /api/v1/revenue/merchants?quantity=1000' do
		before {get "/api/v1/revenue/merchants?quantity=1000"}

		it "returns merchants" do
			expect(json["data"].empty?).to eq false
			expect(json["data"].first["type"]).to eq "merchant_name_revenue"
		end
	end

	describe 'GET /api/v1/revenue/merchants?quantity=plusoneifyoulookhere' do
		before {get "/api/v1/revenue/merchants?quantity=plusoneifyoulookhere"}

		it "returns a 404" do
			expect(json["data"].empty?).to eq true
			expect(json["error"].present?).to eq true
		end
	end

	describe 'GET http://localhost:3000/api/v1/revenue/merchants/:id' do
		before {get "/api/v1/revenue/merchants/#{@merchant_1.id}"}

		it "returns a merchants revenue" do
			expect(json["data"].class).to eq Hash
			expect(json["data"]["attributes"].length).to eq 1
			expect(json["data"]["attributes"]["revenue"]).to eq 10
		end
	end
end
