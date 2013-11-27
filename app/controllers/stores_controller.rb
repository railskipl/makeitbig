class StoresController < ApplicationController
	before_action :set_user
	def index
		@stores = @user.stores
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
			redirect_to user_stores_path(@user), :notice => "Your Store Created!"
		else
			render :new
		end
	end

	def edit
		@store = @user.stores.find(params[:id])
	end

	def update
		@store = Store.find(params[:id])
		if @store.update(store_params)
			redirect_to user_stores_path(@user), :notice => "Store Updated"
		else
			render :edit
		end
	end

	private

	def store_params
		params.require(:store).permit(:owner_name, :email, :address, :city, :state, :country, :phone)
	end

	def set_user
		@user = User.find(params[:user_id])
	end


end
