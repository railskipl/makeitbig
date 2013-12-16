class PlansController < ApplicationController
	def index
		@plans = Plan.all
	end

	def create
		@user = current_user
		store = Store.find_by_user_id(@user)
		if @user.plan_id == 1
			@user.update(:plan_id => params[:plan_id])
			redirect_to plans_path
		elsif store.products.size > Plan.find(1).limit
			redirect_to plans_path, :notice => "Limit your products size to #{Plan.find(1).limit}. Please delete products & come back!"
		else
			@user.update(:plan_id => params[:plan_id])
			redirect_to plans_path, :notice =>"You are back to free account plan!"
		end
	end


end
