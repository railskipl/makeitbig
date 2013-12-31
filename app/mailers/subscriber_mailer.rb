class SubscriberMailer < ActionMailer::Base
   default from: "supe.s.kunal@gmail.com"
  def registration_confirmation(user)
  	@user = user
  	@store = Store.find(user.store_id)
  	@products = @store.products
  	@products = @products.delete_if {|i| (Date.today - i.created_at.to_date + 1) > 7 }
    mail(:to => user.email, :subject => "products list")
  end
end
