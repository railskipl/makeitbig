class StoresController < ApplicationController
	before_action :set_user
	def index
		@stores = @user.stores
		@meta_keywords = @stores.first.meta_keywords
		@meta_description = @stores.first.meta_desc
	end

	def new
		if @user.stores.size.zero?
			@store = @user.stores.new
		else
			redirect_to main_app.root_url
		end
	end

	def create
		@store = @user.stores.new(store_params)
		if @store.save
			redirect_to user_stores_path(@user), :notice => "Your Store Created! Please Edit If Your Address is Wrong"
		else
			render :new
		end
	end

	def edit
		@store = @user.stores.friendly.find(params[:id])
	end

	def update
		@store = Store.friendly.find(params[:id])
		if @store.update(store_params)
			redirect_to user_stores_path(@user), :notice => "Store Updated"
		else
			render :edit
		end
	end



	def analytics
		@store = Store.friendly.find(params[:id])
		@products = @store.products.order('featured desc').paginate(:page => params[:page], :per_page => 1)
	end


	private

	def store_params
		params.require(:store).permit(:owner_name, :email, :address, :city, :state, :country, :phone, :image, :remote_image_url, :currency, :geoaddress, :latitude, :longitude, :friendly_name, :slug, :gmaps,:meta_keywords,:meta_desc,:facebook_url)
	end

	def set_user
		@user = User.find(params[:user_id])
	end
end
