require 'spec_helper'

	describe "A Store" do
		it "with example attributes is valid" do
    	store = Store.new(store_attributes)
    	expect(store.valid?).to be_true
  	end

  	it "requires owners name" do
  		store = Store.new(owner_name: "")
  		expect(store.valid?).to be_false
  		expect(store.errors[:owner_name].any?).to be_true
  	end

  	it "requires owners email" do
  		store = Store.new(email: "")
  		expect(store.valid?).to be_false
  		expect(store.errors[:email].any?).to be_true
  	end

  	it "requires owners address, city, country" do
  		store_add = Store.new(address: "")
  		store_city = Store.new(city: "")
  		store_country = Store.new(country: "")

  		expect(store_add.valid?).to be_false
  		expect(store_city.valid?).to be_false
  		expect(store_country.valid?).to be_false

  		expect(store_add.errors[:address].any?).to be_true
  		expect(store_city.errors[:city].any?).to be_true
  		expect(store_country.errors[:country].any?).to be_true
  	end


	end

