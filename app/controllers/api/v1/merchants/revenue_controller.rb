class Api::V1::Merchants::RevenueController < ApplicationController

	#GET /api/vi/merchants/:id/items
	def most_revenue
		if params["quantity"].nil? || params["quantity"].to_i < 1
			json_response({data: [] , error: 'error'}, 400)
		else
			json_response(MerchantNameRevenueSerializer.new(Merchant.most_revenue(params["quantity"])))
		end
	end

	def most_items
		if params["quantity"].to_i >= 1
			json_response(ItemsSoldSerializer.new(Merchant.most_items(params["quantity"])))
		else
			json_response({data: [], error: 'error'}, 400)
		end
	end
end
