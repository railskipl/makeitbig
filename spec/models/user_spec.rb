require 'spec_helper'
	describe "A User" do
		it "has a store" do
			user = User.new(user_attributes)
			store = user.stores.new(store_attributes)
			expect(user.stores).to include(store)
		end
	end