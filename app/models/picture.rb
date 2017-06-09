class Picture < ApplicationRecord

belongs_to :property

mount_uploader :image, ImageUploader

validates :image, :presence => true 
end
