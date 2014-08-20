require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'posts' do
  context 'no posts' do
    it 'prompts login' do
    visit '/posts'
    expect(page).to have_content "You need to sign in or sign up before continuing."
    end
  end

  context 'with posts' do
    before do 
      charlie = User.create(email: 'a@a.com', password: '123456789', password_confirmation: '123456789')
      login_as(charlie, :scope => :user)
      Post.create(title: 'Hello world')
    end
    
    it 'displays a list of all posts' do
      visit '/posts'
      expect(page).to have_content 'Hello world'
    end  
  end 

  describe 'creating posts' do
    before do 
      charlie = User.create(email: 'a@a.com', password: '123456789', password_confirmation: '123456789')
      login_as(charlie, :scope => :user)
    end
    it 'adds the posts from a form' do    
      visit '/posts'
      click_link 'New post'
      fill_in 'Title', with: 'A brand new post'
      click_button 'Create post'

      expect(page).to have_content 'A brand new post'
      expect(current_path).to eq '/posts'
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