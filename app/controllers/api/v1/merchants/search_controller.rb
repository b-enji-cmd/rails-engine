class Api::V1::Merchants::SearchController < ApplicationController

	#GET /api/vi/merchants/:id
	def show
		@merchant = Merchant.find(params[:id].to_i)
		json_response(@merchant)
	end

end
