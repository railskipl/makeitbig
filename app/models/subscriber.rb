class Subscriber < ActiveRecord::Base
  acts_as_follower
  validates :email, :city, presence: true
  # validates_uniqueness_of :email
   def self.do_something
       puts "somethong"
   end

end
