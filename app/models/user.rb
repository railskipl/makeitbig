class User < ActiveRecord::Base
has_one :plan
has_many :stores, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def plan_name
  	Plan.find(plan_id).name
  end

  def store_not_exists?
  	stores.size.zero?
  end
end
