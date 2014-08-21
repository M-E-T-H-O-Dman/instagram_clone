class VotesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@post.votes.create

		render json: { new_vote_count: @post.votes.count }
	end	
end
