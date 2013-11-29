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

end
