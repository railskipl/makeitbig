require 'file_size_validator'
class ProductImage < ActiveRecord::Base
  belongs_to :product
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :image,
  	:file_size => {
  		:maximum => 0.1.megabytes.to_i
  	}
  validates_integrity_of :image
	validates_processing_of :image
end
