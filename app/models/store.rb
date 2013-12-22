class Store < ActiveRecord::Base
	extend FriendlyId
  friendly_id :friendly_name, use: :slugged

  belongs_to :user
  has_many :products, dependent: :destroy
  validates :owner_name, uniqueness: true
	validates :email, :address, :city, :country, :image, presence: true
	#validates :phone, format: { with: /\d{10}/, message: "bad format" }
	mount_uploader :image, ImageUploader
	CURRENCY = %w[Rs. $ &pound; Euro]
	validates :currency, inclusion: { in: CURRENCY }
	geocoded_by :geoaddress
	after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }

	def friendly_name
		[owner_name,city].compact.join('-')
	end

	def geoaddress
  [address,city,state,country].compact.join(', ')
	end

	def gmaps4rails_address
    [address,city,state,country].compact.join(', ')
  end

	def user_plan_limit
		Plan.find(user.plan_id).limit
	end

end
