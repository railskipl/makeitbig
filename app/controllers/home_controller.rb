class HomeController < ApplicationController
def index
  if params[:query].present?
    @products = Product.friendly.search(params[:query], :page => params[:page])
  else
    @products = Product.friendly.all
  end
    ip = request.ip
    #Harcoaded IP for development.
      @response = Geocoder.search('117.222.40.176')
      @nearby = Store.includes(:user).order("distance").near([@response.first.latitude , @response.first.longitude ], 400)
end

def product_show
	@product = Product.friendly.find(params[:id])
	@product_images = @product.product_images
	impressionist(@product,"visits", :unique=> [:session_hash])
end

def store_catalogue
	@store = Store.friendly.find(params[:id])
	@products = @store.products.paginate(:page => params[:page], :per_page => 7)
end


end
