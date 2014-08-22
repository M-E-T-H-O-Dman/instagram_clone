class PostsController < ApplicationController

before_action :authenticate_user!

	def index
		@posts = Post.all
	end
	
	def new
		@post = Post.new
	end	

	def create
		@post = Post.new(params[:post].permit(:title, :picture, :tag_list, :address))
		@post.user = current_user
		@post.save
		redirect_to '/posts'
	end	
end
