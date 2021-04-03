class Api::V1::Items::SearchController < ApplicationController

	#GET /api/vi/merchants/:id
	def show
		json_response(ItemSerializer.new(Item.find(params[:id])))
	end
end
