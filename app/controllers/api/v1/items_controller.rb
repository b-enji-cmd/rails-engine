class Api::V1::ItemsController < ApplicationController

	#GET /api/vi/items
	def index
		per_page
		page_num
		page_helper(ItemSerializer, Item)
	end

	def create
		@item = Merchant.find(params[:merchant_id]).items.create(item_params)
		json_response(ItemSerializer.new(@item), :created) if @item.save
	end

	def update
		@item = Item.find(params[:id])
		@item.update!(item_params)
		json_response(ItemSerializer.new(@item))
	end

	def destroy
		Item.find(params[:id]).destroy
	end

	# private


	def item_params
		params.permit(:name, :description, :unit_price, :merchant_id)
	end
end
