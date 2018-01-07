class Event < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	mount_uploader :image2, ImageUploader
	mount_uploader :image3, ImageUploader
	mount_uploader :image4, ImageUploader
	mount_uploader :image5, ImageUploader
	mount_uploader :image6, ImageUploader
	mount_uploader :image7, ImageUploader
	mount_uploader :image8, ImageUploader
	mount_uploader :image9, ImageUploader
	#attr_accessor :folder_name, :fn
end
