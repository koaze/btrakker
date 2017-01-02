class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id # assing the post to the user who created it.
		respond_to do |f|
			if (@post.save)
				f.html { redirect_to :back }
			else
				f.html { redirect_to :back, notice: "Error: Post Not Saved." }
			end
		end
	end

	def destroy
		 @post = Post.find(params[:id])
		 @post.destroy
		 flash[:danger] = " deleted"
		 redirect_to :back
	end
	

	private
	def post_params # allows certain data to be passed via form.
		params.require(:post).permit(:user_id, :content)
	end
end