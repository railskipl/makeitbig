class AddGmapsToStore < ActiveRecord::Migration
  def change
    add_column :stores, :gmaps, :boolean
  end
end
