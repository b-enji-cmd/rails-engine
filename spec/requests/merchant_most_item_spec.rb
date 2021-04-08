require "rails_helper"

RSpec.describe 'Merchants Revenue Most Items API', type: :request do
	before :all do
    setup_five_merchants_revenue
  end
	describe 'GET api/v1/merchants/most_items' do
		before {get "/api/v1/merchants/most_items?quantity=10"}

		it "returns merchants sorted by the number of items sold" do
			expect(json["data"].first["attributes"].length).to eq 2
			expect(json["data"].first["attributes"]["count"]).to eq 5
		end
	end

	describe 'GET api/v1/merchants/most_items' do
		before {get "/api/v1/merchants/most_items?quantity=-1"}

		it "returns no data for negative quantity" do
			expect(json["data"].empty?).to eq true
			expect(json["error"].present?).to eq true
		end
	end

	describe 'GET api/v1/merchants/most_items' do
		before {get "/api/v1/merchants/most_items"}

		it "returns no data for missing quantity" do
			expect(json["data"].empty?).to eq true
			expect(json["error"].present?).to eq true
		end
	end
end
