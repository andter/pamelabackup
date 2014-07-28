class StaticPagesController < ApplicationController
	def home
		@title = "Home";
		@posts = Post.ordered_posts	
	end

	def help
	
	end

	def dashboard
	end

	def uindex
		@users = User.all
	end	

	def packages
	
	end 

	end
