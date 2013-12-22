class AddCityToBigDeals < ActiveRecord::Migration
  def change
    add_column :big_deals, :city, :string
    add_column :big_deals, :country, :string
  end
end
