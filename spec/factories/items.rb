FactoryBot.define do
	factory :item do
		name { Faker::Appliance.equipment }
		description { Faker::Lorem.word}
		unit_price { Faker::Number.decimal(l_digits: 3, r_digits:2)}
		merchant
	end
end
