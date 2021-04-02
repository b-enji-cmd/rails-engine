class MerchantFacade

	def self.all_merchants(amount_per_page,page_number)
		Merchant.all.limit(amount_per_page).offset(page_number)
	end

	def self.find_merchant(id)
		Merchant.find(id)
	end
end
