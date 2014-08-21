require 'rails_helper'

describe 'voting on posts' do
	before do
		charlie = User.create(email: 'a@a.com', password: '123456789', password_confirmation: '123456789')
    	login_as(charlie, :scope => :user)
		Post.create(title: 'Hello world', picture: File.new(Rails.root.join('spec/images/pear_programming_250.png')), user_id: User.first.id)
	end	

	it 'can vote on posts, updating the posts vote count', js: true do
		visit '/posts'
		click_link 'So mainstream...'
		expect(page).to have_css('p', text: '-1')
	end	
end	