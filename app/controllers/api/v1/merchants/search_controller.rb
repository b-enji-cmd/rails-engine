class Api::V1::Merchants::SearchController < ApplicationController

	#GET /api/vi/merchants/:id
	def show
		json_response(MerchantSerializer.new(Merchant.find(params[:id])))
	end
end
