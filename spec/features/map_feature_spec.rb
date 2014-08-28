require 'rails_helper'


describe 'maps' do 
	before do
		charlie = User.create(email: 'a@a.com', password: '123456789', password_confirmation: '123456789')
      	login_as(charlie, :scope => :user)
		Post.create(title: 'Post with address', address: '25 City Road, London', picture: File.new(Rails.root.join('spec/images/pear_programming_250.png')), user_id: User.first.id)
	end	

	it 'displays a map when the Map button is clicked', js: true do
		visit '/posts'
		click_link 'Map'

		#TESTING FOR PRESENCE OF GMAPSs
		expect(page).to have_css '.gm-style'
	end	
end	