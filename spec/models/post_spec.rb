require 'rails_helper'

RSpec.describe Post, :type => :model do 
	
  let(:pic)   { Rack::Test::UploadedFile.new(Rails.root.join('spec/images/pear_programmin_250.png')) }
  let(:user)  { User.create(email: 'a@a.com', password: '123456789', password_confirmation: '123456789')  }
  let(:post) { Post.create(title: 'New post', picture: pic, user_id: user.id) }

context 'validations' do
    
    it 'must have a title' do
      invalid_post = Post.new(picture: pic, user_id: user.id)
      expect(invalid_post).not_to be_valid
      expect(invalid_post.errors.messages[:title]).to include('Your post must have a title')
    end

    it 'must have a picture' do
      invalid_post = Post.new(title: 'New post', user_id: user.id)
      expect(invalid_post).not_to be_valid
      expect(invalid_post.errors.messages[:picture]).to include('You must attach a photo')
    end

    it 'must belong to a user' do
      invalid_post = Post.new(title: 'New post', picture: pic)
      expect(invalid_post).not_to be_valid
      expect(invalid_post.errors.messages[:user_id]).to include('You must be signed in to post')
    end

    it 'is valid with a title, picture and user' do
      valid_post = Post.new(title: 'New post', picture: pic, user_id: user.id)
      expect(valid_post).to be_valid
      expect(valid_post).to have_attached_file(:picture)
    end
  
  end



  describe '#tag_list=' do

  let(:post) { Post.create(title: 'Example post')}
    context 'no tags provided' do
      it 'gives 0 tags to post' do
        post.tag_list = ''
        expect(post.tags).to be_empty
      
      end  
    end  

    context '1 tag' do
      it ' adds that tag to our post' do
        post.tag_list = '#yolo'
        expect(post.tags.first.text).to eq '#yolo'
      end  
    end 

    context 'multiple tags' do
      it 'adds all tags seperately' do
        post.tag_list = '#yolo, #swag'
        expect(post.tags.count).to eq 2
      end  
    end 

    context 'with existing tags' do
      before { Tag.create(text: '#yolo')}
      it 'reuses them' do
        post.tag_list = '#yolo, #swag'
        expect(Tag.count).to eq 2
      end  
    end 

    context 'with duplicate tags' do
      it 'deduplicates them' do
        post.tag_list = '#yolo, #swag, #yolo'
        expect(Tag.count).to eq 2
      end  
    end 
  end	
end
