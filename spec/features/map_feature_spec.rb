require 'rails_helper'


describe 'maps' do 
	before do
		charlie = create(:user)
		create(:post)

	it 'displays a map when the Map button is clicked', js: true do
		visit '/posts'
		click_link 'Map'

		#TESTING FOR PRESENCE OF GMAPSs
		expect(page).to have_css '.gm-style'
	end	
end	