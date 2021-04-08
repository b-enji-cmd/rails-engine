FactoryBot.define do
	factory :customer do
		first_name { Faker::Appliance.equipment }
		last_name { Faker::Name.last_name }
	end
end
