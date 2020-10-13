class CommentsController < ApplicationController

	def create
		post = Post.find(params[:post_id])
		comment = current_user.comments.new(comment_params)
		comment.post_id = post.id
		comment.save
		redirect_to post_path(post)
	end

	def destroy
		post = Post.find(params[:post_id])
		Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
		redirect_to post_path(post)
	end

	private
	def comment_params
		params.require(:comment).permit(:comment, :user_id, :post_id)
	end
end
