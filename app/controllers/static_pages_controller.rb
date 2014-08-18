class StaticPagesController < ApplicationController
	def home
		@title = "Home";
		@posts = Post.ordered_posts	
	end

	def gallery
		@user = User.find_by_email("mommietofive@aol.com")
		@mainImage = @user.photos.first
		@images = @user.photos.all
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
