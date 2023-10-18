FactoryBot.define do
	factory :purchase do
		user
		name { 'Water' }
		amount { 12.5 }
	end
end