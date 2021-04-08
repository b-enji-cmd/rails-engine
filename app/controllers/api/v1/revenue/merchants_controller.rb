class Api::V1::Revenue::MerchantsController < ApplicationController
	def revenue
		json_response(MerchantRevenueSerializer.new(Merchant.total_revenue(params[:id])))
	end
end
