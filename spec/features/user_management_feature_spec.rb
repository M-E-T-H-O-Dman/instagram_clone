require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'User management' do

	context 'logged out' do

    it 'should not be able to post photos when logged out, and should prompt to sign in' do
      visit '/posts'
      fill_in 'post_title', with: 'stuff'
      click_button 'Add post'
      expect(page).to have_content "You need to sign in or sign up before continuing."
    end 
  end	
		
  context 'logged in' do

    before do 
      charlie = User.create(email: 'a@a.com', password: '123456789', password_confirmation: '123456789')
      login_as(charlie, :scope => :user)
    end  

    it 'should be able to post photos when logged in' do
      visit '/posts'
      fill_in 'post_title', with: 'stuff'
      click_button 'Add post'
      expect(page).to have_content 'stuff'
    end  
	end
end	

