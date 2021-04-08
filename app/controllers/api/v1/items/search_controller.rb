class Api::V1::Items::SearchController < ApplicationController

	#GET /api/vi/merchants/:id
	def show
		json_response(ItemSerializer.new(Item.find(params[:id])))
	end

	def find_all

		if !params[:name].nil?
			matching_items = Item.order(name: :asc).where("name ILIKE ? or description LIKE ?", "%#{params[:name]}%","%#{params[:name]}%")
			json_response(ItemSerializer.new(matching_items))
		else
			json_response({data: []})
		end
	end

	def find
   if item_search_helper
    item_object_search_helper
    json_response(ItemSerializer.new(@item.first!))
   else
   	json_response({data: {}, error: 'error'}, 400)
   end
	end

	private
 def item_params(params)
   params.permit(:name, :min_price, :max_price)
 end
end
