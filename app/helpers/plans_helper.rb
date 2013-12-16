module PlansHelper
	def format_my_plan(plan)
		if current_user.plan_id == plan.id
				"Current Plan"
		elsif current_user.plan_id == 2
				"-"
		else
				link_to "Upgrade", plan_update_path(:plan_id => 2), :method => :plan_update
		end
	end
end
