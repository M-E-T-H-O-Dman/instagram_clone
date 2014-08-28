FactoryGirl.define do
	factory :user do
    email 'a@example.com'
    password: '123456789'
    password_confirmation: '123456789'
	end	
end	