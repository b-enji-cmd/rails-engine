module Response
	def json_response(arg_data, status = :ok)
		render json: arg_data, status: status
	end
end
