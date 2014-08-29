require 'rails_helper'

describe 'voting on posts' do
	before do
		charlie = charlie = create(:user)
    	login_as(charlie, :scope => :user)
		Post.create(title: 'New post', picture: File.new(Rails.root.join('spec/images/pear_programming_250.png')), user_id: user.id)
	end	

	it 'can vote on posts, updating the posts vote count', js: true do
		visit '/posts'
		click_link 'So mainstream...'
		expect(page).to have_css('p', text: '-1')
	end	
end	