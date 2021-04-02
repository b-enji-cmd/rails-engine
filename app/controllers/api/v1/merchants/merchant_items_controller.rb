class Api::V1::Merchants::MerchantItemsController < ApplicationController

	#GET /api/vi/merchants/:id/items
	def index
		json_response(ItemSerializer.new(MerchantFacade.find_merchant_items(params[:id])))
	end
end
