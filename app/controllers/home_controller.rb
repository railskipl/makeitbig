class HomeController < ApplicationController
def index
  if params[:query].present?
    @products = Product.friendly.search(params[:query], :page => params[:page])
  else
    @products = Product.friendly.all
  end
    ip = request.ip
    #Harcoaded IP for development.
      @response = Geocoder.search('117.218.169.250')
      if @response.blank?
        @nearby = Store.includes(:user).order("distance").near(["21.1500" , "79.0900" ], 400) 
        @big_deals = BigDeal.order("distance").near(["21.1500" , "79.0900" ], 200).limit(3) 
      else
        @nearby = Store.includes(:user).order("distance").near([@response.first.latitude , @response.first.longitude ], 400) 
        @big_deals = BigDeal.order("distance").near([@response.first.latitude , @response.first.longitude ], 200).limit(3) 
      end
end

def create
	session[:temporary_shopping_cart] = [] if session[:temporary_shopping_cart].nil?
 if session[:temporary_shopping_cart] == []
 	session[:temporary_shopping_cart] = []
 			session[:temporary_shopping_cart] << params[:product_id]
 			redirect_to :back
 else
 	if session[:temporary_shopping_cart].include?(params[:product_id])
			redirect_to :back, :notice => 'This item exists! Try other!'
	elsif session[:temporary_shopping_cart].size > 4
			redirect_to :back, :notice => "Max 5 items can be compared!"
	else
 			session[:temporary_shopping_cart] = [] unless params[:product_id]
 			session[:temporary_shopping_cart] << params[:product_id]
 			redirect_to :back
 	end
 end
end

def destroy
	session[:temporary_shopping_cart].delete(params[:product_id])
	redirect_to :back
	rescue ActionController::RedirectBackError
  		redirect_to root_path
end

def productlists
	  @productlists = ProductList.order(:name)
	  respond_to do |format|
      format.json { render json: @productlists.json_tokens(params[:q]),:callback => params['callback']}
     end
end

def compare_product
	@products = session[:temporary_shopping_cart]
end

def product_show
	@product = Product.friendly.find(params[:id])
	@product_images = @product.product_images
	@nearby = Store.where("id NOT LIKE ?",@product.store_id).order("distance").near([@product.store.latitude , @product.store.longitude ], 400) 
	 # @nearby = @nearby.includes(:products)
	impressionist(@product,"visits", :unique=> [:session_hash])
end

def store_catalogue
	@store = Store.friendly.find(params[:id])
	@products = @store.products.paginate(:page => params[:page], :per_page => 7)
	@meta_keywords = @store.meta_keywords
	@meta_description = @store.meta_desc
end


end
