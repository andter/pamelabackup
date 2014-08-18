class RemoveGalleryImages < ActiveRecord::Migration
  def change
		drop_table :gallery_images
	end
end
