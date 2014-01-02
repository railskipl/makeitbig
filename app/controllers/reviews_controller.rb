class ReviewsController < ApplicationController
	before_action :set_product

	def index
  		@reviews = @product.reviews
  		@store = @product.store
	end

	def new
		@review = @product.reviews.new
		@store = @product.store
	end

	def create
		@store = @product.store
		@review = @product.reviews.new(reviews_params)
<<<<<<< HEAD
<<<<<<< HEAD
		@store = @product.store
=======

>>>>>>> ankit
=======

>>>>>>> ankit
		if @review.save
			redirect_to product_reviews_path(@product),
						notice: "Thanks, for your review."
		else
			render "new"
		end
	end

	def edit
		@review = @product.reviews.find(params[:id])
		@store = @product.store
	end

	def update
		 @review = Review.find(params[:id])
    if @review.update(reviews_params)
      redirect_to product_reviews_path(@product), :notice => "Product Review updated Successfully!"
    else
      render :edit
    end

	end
	def destroy
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_reviews_path(@product), :notice => "Review destroyed Successfully!"
  end

	private

	def reviews_params
		params.require(:review).permit(:name, :stars, :comments)
	end

	def set_product
		@product = Product.friendly.find(params[:product_id])
	end

end

