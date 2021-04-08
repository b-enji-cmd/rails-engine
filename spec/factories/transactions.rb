FactoryBot.define do
	factory :transaction do
		result { "success" }
		credit_card_number {Faker::Number.number(digits: 16)}
		credit_card_expiration_date { "4/23"}
		invoice
	end
end
