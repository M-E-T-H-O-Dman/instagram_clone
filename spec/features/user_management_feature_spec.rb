require 'rails_helper'

describe 'User management' do

	context 'logged out' do

    it 'should not be able to post photos when logged out, and should prompt to sign in' do
      visit '/posts'
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
      click_link 'New post'
      fill_in 'Title', with: 'stuff'
       attach_file 'Picture', Rails.root.join('spec/images/pear_programming_250.png')
      click_button 'Create post'
      expect(page).to have_content 'stuff'
    end  
	end
end	

