require 'rails_helper'

describe 'tagging posts' do 
	before do 
      charlie = create(:user)
      login_as(charlie, :scope => :user)
    end  
	it 'displays tags as links under posts' do
  	visit '/posts'
    click_link 'New post'
    fill_in 'Title', with: 'A brand new post'
    fill_in 'Tags', with: '#yolo, #swag'
    attach_file 'Picture', Rails.root.join('spec/images/pear_programming_250.png')
    click_button 'Create post'

    expect(page).to have_link '#yolo'
    expect(page).to have_link '#swag'
	end	
end	