require 'rails_helper'


describe 'maps' do 
	before do
		charlie = create(:user)
		login_as(charlie, :scope => :user)
		Post.create(title: 'New post', picture: File.new(Rails.root.join('spec/images/pear_programming_250.png')), user_id: User.first.id, address: '25 City Road, London')
	end
	it 'displays a map when the Map button is clicked', js: true do
		visit '/posts'
		click_link 'Map'

		#TESTING FOR PRESENCE OF GMAPSs
		expect(page).to have_css '.gm-style'
	end	
end	