class Api::V1::Merchants::MerchantItemsController < ApplicationController

	#GET /api/vi/merchants/:id/items
	def index
		json_response(ItemSerializer.new(Merchant.find(params[:id]).items))
	end
end
