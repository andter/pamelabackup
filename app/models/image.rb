class Image < ActiveRecord::Base
#attr_accessible :image, :name, :description
mount_uploader :image, ImagesUploader
belongs_to :user


end
