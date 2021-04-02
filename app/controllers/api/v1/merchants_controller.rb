class Api::V1::MerchantsController < ApplicationController

	#GET /api/vi/merchants
	def index
		params[:per_page] ? @merchants = Merchant.all.limit(params[:per_page].to_i) : @merchants = Merchant.all.limit(20)
		json_response(@merchants)
	end
end
