module HomeHelper
		def current_plan
			current_user.plan_name
		end

		def store_new_edit
			if current_user.store_not_exists?
				link_to "Create a Store", new_user_store_path(current_user),  :class=>"btn btn-primary btn-primary"
			else
				link_to "My Store", user_stores_path(current_user), :class=>"btn btn-primary btn-primary"
			end
		end

#show image if it has premium plan
	def product_search_image(id)
		images = ProductImage.where("product_id =?", id)
		if images.first == nil
			elsif Product.find(id).featured == true
				image_tag images.first.image_url(:thumb)
			else
			''
		end
	end

	def show_offer(id)
		offers = Product.find(id).offer
		if Product.find(id).offer?
				content_tag(:strong, offers + ' Discount', :style => "color:red;")
		end
	end

	def store_owner(id)
		Store.friendly.find(id).owner_name
	end

	def search_price(id)
		Store.find(id).currency
	end

	def store_details(id)
		Store.find(id)
	end

	def count_comments(product)
		product.reviews.pluck(:comments).each do |product|
			product
		end
	end

	def search_average_stars(id)
    if Product.find(id).average_stars.nil?
      content_tag(:strong, 'No ratings')
     else
     content_tag(:strong, '*' * Product.find(id).average_stars.round)
    end
	end

	def meta_desc(id)
		if Product.find(id).meta_description?
			content_tag(:strong, Product.find(id).meta_description)
		else
			content_tag(:strong, Product.find(id).description)
		end
	end

end
