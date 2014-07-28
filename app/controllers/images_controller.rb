class ImagesController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@images = @user.images
	end

	def new
		@user = User.find(params[:user_id])
		@image = @user.images.new()
	end

	def create
		@user = User.find(params[:user_id])
		@image = @user.images.new(image_params)

		if @image.save
			redirect_to user_images_path, :notice => "Your image was added"	
		else 
			render 'new'	
		end
	end

	def show
		@user = User.find(params[:user_id])
		@image = Image.find(params[:id])
	end

	def destroy
		@user = User.find(params[:user_id])
		@image = Image.find(params[:id])
		@image.destroy
			redirect_to user_images_path(@user), :notice => "Deleted"
	end

	private 

	def image_params
		params.fetch(:image, {}).permit(:name, :description, :image)
	end
end
