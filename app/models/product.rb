class Product < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  belongs_to :store
  belongs_to :category
  belongs_to :subcategory
  has_many :product_images, dependent: :destroy
  has_many :reviews
  include Tire::Model::Search
  include Tire::Model::Callbacks
  ac_field :name
  validates :name, :description, presence: true
  validates :price , numericality: { greater_than_or_equal_to: 0 }
  is_impressionable

  def product_img
  	product_images.first
  end

  def max?
  	product_images.size >= 3
  end

# Self.search checks if it is available, then sort results first by offers, featured & then price.
def self.search(query, params={})
  tire.search(page: params[:page], per_page: 7) do
     query { string query, default_operator: "AND", phrase_slop: 3 }
     filter :terms, :is_available => [true]
     sort do
     	by :featured, 'desc'
     	by :offer, 'desc'
     	by :price
    end
	end

end

def to_indexed_json
  to_json(methods: [:store_city, :store_name, :scategory])
end

def store_name
  store.owner_name
end

def store_city
  store.city
end

def scategory
	subcategory.subcategory
end

def average_stars
  reviews.average(:stars)
end

def plan_search
	store.user.plan_
end

end
