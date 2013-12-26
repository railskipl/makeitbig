class ProductsController < ApplicationController
	before_action :set_user_store
	def index
    @products = @store.products.friendly.includes(:category, :subcategory)
	end

	def new
		if @store.products.size < @store.user_plan_limit
			@product = @store.products.new
		else
			redirect_to user_stores_path(current_user),
											:notice => "Please upgrade your plan, max limit reached!"
		end
	end

	def create
		@product = @store.products.new(product_params)
		if @product.save
			redirect_to user_store_products_path(@user, @store, @product), :notice => "Product Created!"
		else
			render :new
		end
	end

	def edit
		@product = @store.products.friendly.find(params[:id])
	end

	def update
		@product = @store.products.friendly.find(params[:id])
		if @product.update(product_params)
			redirect_to user_store_products_path(@user, @store, @product), :notice => "Product - #{@product.name} Updated"
		else
			render :edit
		end
	end

	def show
		@product = @store.products.friendly.find(params[:id])
		@product_images = @product.product_images
		@meta_keywords = @product.meta_keywords
		@meta_description = @product.meta_description
	end

	def destroy
		@product = @store.products.friendly.find(params[:id])
		if @product.destroy
			redirect_to user_store_products_path(@user, @store, @product), :notice => "Product deleted!"
		end
	end

	def subcategories_by_category
  if params[:id].present?
    @subcategories = Category.find(params[:id]).subcategories
  else
    @subcategories = [].includes(:subcategory)
  end

  respond_to do |format|
    format.js
  end
end


def toggled_feature
@product = @store.products.find(params[:id])
if @store.products.where('featured =?',true).count <= 9
	@product.featured = !@product.featured?
	@product.save!
	redirect_to user_store_products_path(@user, @store, @product)
elsif @store.products.find(params[:id]).featured
		@product.featured = !@product.featured?
		@product.save!
		redirect_to user_store_products_path(@user, @store, @product)
else
	redirect_to user_store_products_path(@user, @store, @product), :notice => "Only 10 products can be made featured!"
end
end

	private

	def product_params
		params.require(:product).permit(:name, :description, :price, :warranty, :is_available, :user_id, :product_image_id, :category_id, :subcategory_id, :meta_keywords, :meta_description, :offer, :featured) if params[:product]
	end

	def set_user_store
		@user = User.find(params[:user_id])
		@store = Store.friendly.find(@user.stores[0])
	end
end
