class ApplicationController < ActionController::Base
	rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url
  end
  protect_from_forgery with: :exception

  before_filter :meta_defaults

  def meta_defaults
      @meta_title = "Welcome to FastShoppy.com"
      @meta_keywords = "FastShoppy, FastShoppy.com, Books, Online Shopping, Book Store, Magazine, Music, CDs, DVDs, Videos, Electronics, Video Games, Computers, Cell Phones, Toys, Games, Apparel, Accessories, Shoes, Jewelry, Watches, Office Products, Sports &amp; Outdoors, Sporting Goods, Baby Products, Health, Personal Care, Beauty, Home, Garden, Bed & Bath, Furniture, Tools, Hardware, Vacuums, Outdoor Living, Automotive Parts, Pet Supplies, Broadband, DSL"
      @meta_description = "FastShoppy"
  end

end
