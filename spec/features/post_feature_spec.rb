require 'rails_helper'

describe 'with no posts' do
  context 'no posts' do
    it 'prompts login' do
    visit '/posts'
    expect(page).to have_content "You need to sign in or sign up before continuing."
    end
  end
end

describe 'with posts' do

  
  context 'with posts' do
    before do 
      charlie = create(:user)
      login_as(charlie, :scope => :user)
      Post.create(title: 'New post', picture: File.new(Rails.root.join('spec/images/pear_programming_250.png')), user_id: User.first.id)
    end
    it 'displays a list of all posts' do
      visit '/posts'
      expect(page).to have_content 'New post'
    end  
  end 

  describe 'creating posts' do
    before do 
      charlie = create(:user)
      login_as(charlie, :scope => :user)
     
    end
    it 'adds the posts from a form' do    
      visit '/posts'
      click_link 'New post'
      fill_in 'Title', with: 'A brand new post'
      attach_file 'Picture', Rails.root.join('spec/images/pear_programming_250.png')
      click_button 'Create post'
      expect(page).to have_content 'A brand new post'
      expect(current_path).to eq '/posts'
    end
  end
  
  describe 'attaching images' do

    before do 
      charlie = create(:user)
      login_as(charlie, :scope => :user)
    end
    it 'can attach an image to a post' do
      visit '/posts'
      click_link 'New post'
      fill_in 'Title', with: 'A brand new post'
      attach_file 'Picture', Rails.root.join('spec/images/pear_programming_250.png')
      click_button 'Create post'

      expect(page).to have_css 'img.uploaded-pic'
    end  
  end
end  