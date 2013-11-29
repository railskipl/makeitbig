class HomeController < ApplicationController

def index
  if params[:query].present?
    @products = Product.search(params[:query], load: true)
  else
    @products = Product.all
  end
end
		#@results = Product.search(params[:query], :page => params[:page])
end
