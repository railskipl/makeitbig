class Store < ActiveRecord::Base
  belongs_to :user
  has_many :products, dependent: :destroy
	validates :owner_name, :email, :address, :city, :country, presence: true
	mount_uploader :image, ImageUploader
	CURRENCY = %w[Rs. $ &pound; Euro]
	validates :currency, inclusion: { in: CURRENCY }

	def user_plan_limit
		Plan.find(user.plan_id).limit
	end

end
