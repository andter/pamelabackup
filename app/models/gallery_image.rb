class GalleryImage < ActiveRecord::Base
mount_uploader :gallery_image, GalleryImageUploader

end
