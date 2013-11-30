class HomeController < ApplicationController

def index
  if params[:query].present?
    @products = Product.search(params[:query], load: true)
  else
    @products = Product.all
  end
end

def product_show
	@product = Product.find(params[:id])
	@product_images = @product.product_images
end

end
