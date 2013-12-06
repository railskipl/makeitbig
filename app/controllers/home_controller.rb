class HomeController < ApplicationController

def index
  if params[:query].present?
    @products = Product.search(params[:query], :page => params[:page])
  else
    @products = Product.all
    @store = Store.all
    @hash = Gmaps4rails.build_markers(@store) do |store, marker|
 			 marker.lat store.latitude
  		 marker.lng store.longitude
  		 marker.infowindow "#{store.owner_name} - #{store.address}"
  	end
  end
end

def product_show
	@product = Product.find(params[:id])
	@product_images = @product.product_images
end

def store_catalogue
	@store = Store.find(params[:id])
	@products = @store.products.paginate(:page => params[:page], :per_page => 7)
end

end
