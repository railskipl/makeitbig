class BigDeal < ActiveRecord::Base

	validates :email, :image, :city, :country, presence: true
	#validates :phone, format: { with: /\d{10}/, message: "bad format" }
	mount_uploader :image, ImageUploader
	after_save :save_end_date
	geocoded_by :geoaddress
	after_validation :geocode

	def geoaddress
  	[city,country].compact.join(', ')
	end


		def save_end_date
			start_date = self.start_date
			end_date = self.end_date
			date_end = start_date + 30.days
			update_column(:end_date, date_end)
		end

end
