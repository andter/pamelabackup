class PostsController < ApplicationController

def index
	@posts= Post.ordered_posts
end

def new
	@post = Post.new
end

def show
	@post = Post.find(params[:id])
end

def create
	@post = Post.new(post_params)
	
	if @post.save
		redirect_to "/home", :notice => "Your post was saved"
	else
		render "new"
	end
end

def edit
	@post = Post.find(params[:id])
end

def update
	@post = Post.find(params[:id])

	if @post.update_attributes(post_params)
		redirect_to "/home", :notice => "Your post was updated"
	else
		render "edit"
	end
end

def destroy
	@post = Post.find(params[:id])
	@post.destroy
		redirect_to "/home", :notice => "Post has been deleted"
end

private 
	def post_params()
		params.fetch(:post, {}).permit(:title, :content)
	end
end
