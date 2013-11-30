class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :store
  has_many :product_images, dependent: :destroy
  include Tire::Model::Search
  include Tire::Model::Callbacks
  validates :name, :description, presence: true
  validates :price , numericality: { greater_than_or_equal_to: 0 }

  def product_img
  	product_images.first
  end

  def max?
  	product_images.size >= 3
  end

def self.search(query, params={})
  tire.search(page: params[:page], per_page: 10) do
     query { string query, default_operator: "AND" }
     sort { by :published_at, "desc" } if query.blank?
	end
end

def to_indexed_json
  to_json(methods: [:store_name])
end

def store_name
  store.owner_name
end

end
