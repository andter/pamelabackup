class GalleryImage < ActiveRecord::Base
mount_uploader :image, ImagesUploader

end
