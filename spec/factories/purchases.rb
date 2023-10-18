FactoryBot.define do
	factory :purchase do
		association :author, factory: :user
		name { 'Water' }
		amount { 12.5 }
	end
end