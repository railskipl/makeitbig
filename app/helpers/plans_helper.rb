module PlansHelper
	def format_my_plan(plan)
		if current_user.plan_id == plan.id
				"Current Plan"
		else
				"Upgrade"
		end
	end
end
