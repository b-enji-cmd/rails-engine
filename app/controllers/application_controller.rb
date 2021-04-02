class ApplicationController < ActionController::API
	include Response
	#set default results per page to 20 unless specified otherwise
	def per_page
		params[:per_page].to_i if params[:per_page].to_i.positive?
		20
	end
	#set default page number to 1 unless specified otherwise
	def page_num
		params[:page].to_i if params[:page].to_i >= 1
		1
	end
end
