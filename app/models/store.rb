class Store < ActiveRecord::Base
	extend FriendlyId
  friendly_id :friendly_name, use: :slugged
  acts_as_followable
  belongs_to :user
  has_many :products, dependent: :destroy
  has_many :subscribers, dependent: :destroy
  validates :owner_name, uniqueness: true
  validates :email, :address, :city, :country, :image, presence: true
  #validates :phone, format: { with: /\d{10}/, message: "bad format" }
  mount_uploader :image, ImageUploader
  CURRENCY = %w[Rs. $ &pound; Euro]
  validates :currency, inclusion: { in: CURRENCY }
  geocoded_by :geoaddress
  before_save :meta
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
  validate :validate_minimum_image_size

	def validate_minimum_image_size
	  image = MiniMagick::Image.open(self.image.path)
	  unless image[:width] > 200 && image[:height] > 200
	    errors.add :image, "should be 200x200px minimum!" 
	  end
	end

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

	def meta
	 if self.meta_keywords.blank?
	 	metakeywords
	 end
	end

	def metakeywords
	 self.meta_keywords = self.owner_name + "," + self.address + "," + self.city
	end
end
