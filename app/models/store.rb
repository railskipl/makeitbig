class Store < ActiveRecord::Base
  belongs_to :user

  validates :owner_name, :email, :address, :city, :country, presence: true

end
