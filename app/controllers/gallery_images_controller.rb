class GalleryImagesController < ApplicationController

def show
	@gimage = GalleryImage.find(params[:id])	
end

def new
	@gimage = GalleryImage.new
end

def edit
	@gimage=  GalleryImage.find(params[:id])
end

def update
	@gimage = GalleryImage.find(params[:id])

	if @gimage.update_attributes(gallery_params)
			redirect_to "/home", :notice => "Your Image was updated"
	else
		render "edit"
	end
end

def create
	@gimage = GalleryImage.new
	#binding.pry
	#if @gimage.save
	#	redirect_to "/home", notice: "Image saved"
	@gimage.name = params[:gallery_image][:name]
	@gimage.description = params[:gallery_image][:description]
	@gimage.image = params[:gallery_image][:image]
	if @gimage.save
		redirect_to "/home", notice: "Image saved"
	else
		render "new"
	end
	end

def index
	@mainImage = GalleryImage.first()
	@gimages = GalleryImage.all()
end

private 
		def gallery_params()
			params.fetch(:galleryimage, {}).permit(:title, :description, :image)
		end
end
