class Api::V1::MerchantsController < ApplicationController

	#GET /api/vi/merchants
	def index
		@merchants = Merchant.all
		json_response(@merchants)
	end
end
