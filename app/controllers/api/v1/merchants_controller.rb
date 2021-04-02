class Api::V1::MerchantsController < ApplicationController

	#GET /api/vi/merchants
	def index
		#params[:per_page] ? @merchants = Merchant.all.limit(params[:per_page].to_i) : @merchants = Merchant.all.limit(20)
		#render json: { status: :ok , data: MerchantSerializer.new(MerchantFacade.all_merchants(per_page,page_num))}
		json_response(MerchantSerializer.new(MerchantFacade.all_merchants(per_page,page_num)))
	end
end
