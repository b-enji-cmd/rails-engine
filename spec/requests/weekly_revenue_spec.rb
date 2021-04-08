require "rails_helper"

RSpec.describe 'Weekly Revenue API', type: :request do
	before :all do
    setup_five_merchants_revenue
  end
	describe 'GET api/v1/merchants/most_items' do
		before {get "/api/v1/revenue/weekly"}

		it "returns merchants sorted by the number of items sold" do
			expect(json["data"].class).to eq Array
			expect(json["data"].first["type"]).to eq "weekly_revenue"
			expect(json["data"].first["attributes"].length).to eq 2
			expect(json["data"].first["attributes"].keys).to eq ["week", "revenue"]
		end
	end
end
