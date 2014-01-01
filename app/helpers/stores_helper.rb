module StoresHelper

	def add_limit_product(store)
		if  store.products.size >= store.user_plan_limit
				link_to t('.new', :default => t("helpers.links.upgrade_plan")),
            plans_path, :class => 'btn btn-primary'
		else
		link_to t('.new', :default => t("helpers.links.add_Product")),
            new_user_store_product_path(current_user, store),
            :class => 'btn btn-primary'
    end
	end

		def analytics_data(product)
			 dates =  product.impressions.order("created_at asc").map{|c| c.created_at.strftime("%Y-%m-%d")}
			dataset = dates.uniq.map do |u|
 				[u, product.impressionist_count(:start_date=> u, :end_date => u.to_date + 1.day ) ]
 			end
 			return dataset
		end

		def featured_analytics_data(product)
			 dates =  product.impressions.order("created_at asc").map{|c| c.created_at.strftime("%Y-%m-%d")}
			dataset = dates.uniq.map do |u|
 				{:date => u, :count => product.impressionist_count(:start_date=> u, :end_date => u.to_date + 1.day ) }
 			end
 			return dataset
		end


	# def analytics_date_x(product,date_x = [])
	# 	dates =  product.impressions.order("created_at asc").map{|c| c.created_at.strftime("%Y-%m-%d")}
	# 	dates.to_a.uniq.each do |c|
	#  		date_x << c.to_date.strftime("%m/%d/%Y")
	# 	end
	# 	return date_x
	# end

	# def analytics_count(product, count = [])
	# 	dates =  product.impressions.order("created_at asc").map{|c| c.created_at.strftime("%Y-%m-%d")}
	# 	dates.to_a.uniq.each do |c|
	#  		count << product.impressionist_count(:start_date=> c, :end_date => c.to_date + 1.day )
	# 	end
	# 	return count
	# end

end
