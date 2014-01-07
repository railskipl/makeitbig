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
