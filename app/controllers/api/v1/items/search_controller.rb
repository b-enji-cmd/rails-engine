class Api::V1::Items::SearchController < ApplicationController

	#GET /api/vi/merchants/:id
	def show
		json_response(ItemSerializer.new(Item.find(params[:id])))
	end

	def find_all

		if !params[:name].nil?
			matching_items = Item.order(name: :asc).where("name ILIKE ? or description LIKE ?", "%#{params[:name]}%","%#{params[:name]}%")
			if matching_items.nil?
				render json: {data: []}
			else
				render json: ItemSerializer.new(matching_items)
			# json_response(ItemSerializer.new(matching_items))
			end
		else
			render json: {data: []}
		end
	end


	private

	# def price_query
	# 	# injects ar based on which params are present
	# 	if params["min_price"] && !params["max_price"]
	# 		Item.where(["unit_price > ?","#{params["min_price"].to_i}"])
	# 	elsif !params["min_price"] && params["max_price"]
	# 		Item.where(["unit_price < ?","#{params["max_price"].to_i}"])
	# 	elsif params["min_price"] && params["max_price"]
	# 		Item.where(["unit_price < ? and unit_price > ? ","#{params["max_price"].to_i}", "#{params["min_price"].to_i}"])
	# 	end
	# end
end
