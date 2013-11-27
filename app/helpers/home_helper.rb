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
end
