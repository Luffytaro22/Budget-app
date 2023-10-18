FactoryBot.define do
	factory :user do
		id { rand(1..5000) }
		name { 'Manuel' }
		email { "user_#{id}@mail.com" }
		password { 'password123' }
	end
end