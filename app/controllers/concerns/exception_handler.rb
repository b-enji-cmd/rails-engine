module ExceptionHandler
	extend ActiveSupport::Concern

	included do
		rescue_from ActiveRecord::RecordInvalid do |e|
			json_response({message: e.message}, 404)
		end

		rescue_from ActiveRecord::RecordNotFound do |e|
			json_response({data: {}, error: 'error'}, 404)
		end

		rescue_from ActiveRecord::StatementInvalid do |e|
			json_response({data: [], error: 'Invalid PG Statement'}, 404)
		end
	end
end
