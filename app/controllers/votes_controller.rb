class VotesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@post.votes.create

		redirect_to '/posts'
	end	
end
