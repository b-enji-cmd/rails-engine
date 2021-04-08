class Api::V1::Revenue::TimeController < ApplicationController

	#GET /api/vi/merchants/:id/items
	def index
		json_response(WeeklyRevenueSerializer.new(Merchant.weekly_revenue))
	end
end
