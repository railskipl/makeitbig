class Store < ActiveRecord::Base
  belongs_to :user
  has_many :products, dependent: :destroy
	validates :owner_name, :email, :address, :city, :country, presence: true
	mount_uploader :image, ImageUploader
	CURRENCY = %w[Rs. $ &pound; Euro]
	validates :currency, inclusion: { in: CURRENCY }
	geocoded_by :geoaddress
	after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }

	def geoaddress
  [address,city,state,country].compact.join(', ')
	end

	def user_plan_limit
		Plan.find(user.plan_id).limit
	end

end
