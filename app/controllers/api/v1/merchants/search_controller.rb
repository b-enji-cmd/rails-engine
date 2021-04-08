class Api::V1::Merchants::SearchController < ApplicationController

	#GET /api/vi/merchants/:id
	def show
		json_response(MerchantSerializer.new(Merchant.find(params[:id])))
	end

	def find
		matching_merchant = Merchant.order(name: :asc).find_by("name iLIKE ?", "%#{params[:name]}%")
		if matching_merchant.nil?
			json_response({data: {}})
		else
			json_response(MerchantSerializer.new(matching_merchant))
		end
	end
end
