FactoryBot.define do
	factory :group do
		user
		name { 'Food' }
		icon { 'https://live.staticflickr.com/65535/48012754801_260dcc1070.jpg' }
	end
end