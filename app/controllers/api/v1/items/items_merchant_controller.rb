class Api::V1::Items::ItemsMerchantController < ApplicationController

	#GET /api/vi/merchants/:id/items
	def show
		json_response(MerchantSerializer.new(Item.find(params[:id]).merchant))
	end
end
