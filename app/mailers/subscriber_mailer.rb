class SubscriberMailer < ActionMailer::Base
   default from: "supe.s.kunal@gmail.com"
	  def registration_confirmation(user)
	  	@subs = Subscriber.find_all_by_email(user.email)
	  	@products = []
	 	@subs.each do |sub|
	   	  @store = Store.find(sub.store_id)
	  	  @products << @store.products
       end
        @products = @products.flatten.delete_if {|i| (Date.today - i.created_at.to_date + 1) > 8 }
	  	mail(:to => user.email, :subject => "products list")
     end
end

# What happens when user subscribes to multiple stores.
# Cron job would perform following actions:
	# 1. Check subcriber
	# 2. Find all stores for which he is subcribed
	# 3. Find products of each based on dates logic.
	# 4. Deliver mail
	# 5. This will be same for all subcribers
	# 6. Template would show Store name & its newly added products.


# Dates Logic - Fetch products if it is created between today & 7 days back.
# If subcribers store has none products in that period, then do not send mail.
