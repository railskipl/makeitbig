module HomeHelper
		def current_plan
			current_user.plan_name
		end

		def store_new_edit
			if current_user.store_not_exists?
				link_to "Create a Store", new_user_store_path(current_user)
			else
				link_to "My Store", user_stores_path(current_user)
			end
		end

	def product_search_image(id)
		images = ProductImage.where("product_id =?", id)
		if images.first == nil
		else
			images.first.image_url(:thumb)
		end
	end

	def store_owner(id)
		Store.find(id).owner_name
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

end
