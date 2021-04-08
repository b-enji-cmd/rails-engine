class ApplicationController < ActionController::API
	include ActionController::Helpers
	include ExceptionHandler
	include Response
	#set default results per page to 20 unless specified otherwise
	def per_page
		params[:page].to_i < 1 ? @page = 1 : @page = params[:page].to_i
	end
	#set default page number to 1 unless specified otherwise
	def page_num
		params[:per_page].to_i < 1 ? @per_page = 20 : @per_page = params[:per_page].to_i
	end

	def page_helper(serializer, class_arg)
		#only page
		if params[:page] && !params[:per_page]
			json_response(serializer.new(class_arg.all.limit(20).offset(20 * (@page -1) )))
		# only per_page
		elsif !params[:page] && params[:per_page]
			json_response(serializer.new(class_arg.all.limit(@per_page)))
		# both
		elsif params[:page] && params[:per_page]
			json_response(serializer.new(class_arg.all.limit(@per_page).offset(@per_page * (@page - 1) )))
		#none
		else !params[:page] && !params[:per_page]
			json_response(serializer.new(class_arg.all.limit(20)))
		end
	end

	def item_search_helper
	   params[:max_price] && params[:max_price].to_i > 0 && !params[:name] ? true : false
	   params[:name] && !params[:min_price] && !params[:max_price] ? true : false
	   params[:min_price] && params[:max_price] && !params[:name] ? true : false
	   params[:min_price] && params[:min_price].to_i > 0 && !params[:name] ? true : false
	 end

	 def item_object_search_helper
	   @item = Item.where(nil)
	    if item_search_helper
	      item_params(params).each do |key, value|
	          @item = @item.public_send("find_by_#{key}", value)
	      end
	    end
	end

	helper_method :per_page, :page_num
end
