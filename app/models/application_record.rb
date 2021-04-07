class ApplicationRecord < ActiveRecord::Base
	# scope :paginate -> (page = 0, page_num = 20) {	limit(per_page).offset(per_page * (page - 1) )}
  self.abstract_class = true
end
