class PhotosController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@images = @user.photos
	end

	def new
		@user = User.find(params[:user_id])
		@image = @user.photos.new()
	end

	def create
		@user = User.find(params[:user_id])
		@photo = @user.photos.new(photo_params)

		if @photo.save
			redirect_to user_photos_path, :notice => "Your image was added"	
		else 
			render 'new'	
		end
	end

	def show
		@image = Photo.find(params[:id])
	end

	def destroy
		@user = User.find(params[:user_id])
		@image = Photo.find(params[:id])
		@image.destroy
			redirect_to user_photos_path(@user), :notice => "Deleted"
	end

	private 

	def photo_params
		params.fetch(:photo, {}).permit(:name, :description, :image)
	end
end
