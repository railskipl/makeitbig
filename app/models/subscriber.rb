class Subscriber < ActiveRecord::Base
  acts_as_follower
  validates :email, presence: true,uniqueness: { scope: :store_id}
  validates :city, presence: true
  belongs_to :store
  # validates_uniqueness_of :email
end
