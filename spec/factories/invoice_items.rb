FactoryBot.define do
	factory :invoice_item do
		unit_price { Faker::Number.decimal(l_digits: 3, r_digits:2)}
		quantity { Faker::Number.within(range: 1..10)}
		item
		invoice
	end
end
