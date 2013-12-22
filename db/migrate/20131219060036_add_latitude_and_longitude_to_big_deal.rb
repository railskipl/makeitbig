class AddLatitudeAndLongitudeToBigDeal < ActiveRecord::Migration
  def change
    add_column :big_deals, :latitude, :float
    add_column :big_deals, :longitude, :float
  end
end
