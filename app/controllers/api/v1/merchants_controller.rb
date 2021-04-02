class Api::V1::MerchantsController < ApplicationController

	#GET /api/vi/merchants
	def index
		per_page
		page_num
		page_helper(MerchantSerializer, Merchant)
	end
end
