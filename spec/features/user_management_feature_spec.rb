require 'rails_helper'

describe 'User management' do

	context 'signing up' do

		it 'a user can sign up to the site ' do
			_sign_up_test_user
			expect(page).to have_content('Welcome! You have signed up successfully')
			expect(page).to have_content('test@test.com')
		end

	end

	context 'signing in' do

		before(:each) do
			_sign_up_test_user 
			_sign_out
		end

		it 'a user can sign in to the site once signed up ' do
			_sign_in
			expect(page).to have_content('Signed in successfully')
			expect(page).to have_content('test@test.com')
		end

	end

	context 'signing out' do

		before(:each) { _sign_up_test_user }
			
		it 'a user can sign out once signed in' do
			_sign_out
			expect(page).to have_content('Signed out successfully')
			expect(page).not_to have_content('test@test.com')
		end

	end

	# context	'access rights when signed out' do

	# 	it 'a user cannot see a link to add posts' do
	# 		visit '/posts'
	# 		expect(page).not_to have_css 'a', text: 'Add a restaurant'
	# 	end

	# end
end	

def _sign_up_test_user
	_sign_up_user('test@test.com', '12345678')
end

def _sign_up_user(email, password)
	visit '/posts'
	click_link 'Sign Up'
	within('#new_user') do
		fill_in 'user_email', with: email
		fill_in 'user_password', with: password
		fill_in 'user_password_confirmation', with: password
		click_on 'Sign up'
	end
end

def _sign_out
	click_link 'Sign Out'
end

def _sign_in
	click_link 'Sign In'
	fill_in 'user_email', with: 'test@test.com'
	fill_in 'user_password', with: '12345678'
	click_on 'Sign in'
end	