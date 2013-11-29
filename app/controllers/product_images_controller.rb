class ProductImagesController < ApplicationController
	before_action :set_product

	def index
		@products_images = @product.product_images
	end

	def new
		@store = @product.store
		if @product.product_images.size < 3
			@product_image = @product.product_images.new
		else
			redirect_to user_store_product_path(current_user, @store, @product),
											:notice => "Max 3 images are allowed!"
		end


	end


	def create
		@store = @product.store
		@product_image = @product.product_images.new(product_images_params)
		if @product_image.save
			redirect_to user_store_product_path(current_user,@store, @product), :notice => "Images Added"
		else
			render :new
		end
	end

	def show
		@product_image = @product.product_images.find(params[:id])
	end

	def destroy
		@store = @product.store
		@product_image = @product.product_images.find(params[:id])
		if @product_image.destroy
			redirect_to user_store_product_path(current_user,@store, @product), :notice => "Image deleted!"
		end
	end

	private

	def product_images_params
		params.require(:product_image).permit(:image, :user_id)
	end

	def set_product
		@product = Product.find(params[:product_id])
	end
end
