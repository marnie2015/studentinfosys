class Event < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	#attr_accessor :folder_name, :fn
end
