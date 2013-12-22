class BigDealsController < ApplicationController

def new
		@big_deal = BigDeal.new
end

	def create
		@big_deal = BigDeal.new(deal_params)
		if @big_deal.save
			redirect_to root_path, :notice => "Your request has been submitted! You will get a call or email very shortly! Thank You!"
		else
			render :new
		end
	end

private
	def deal_params
		params.require(:big_deal).permit(:name, :store_name, :email, :phone, :city, :country, :start_date, :end_date, :image, :active)
	end



end
