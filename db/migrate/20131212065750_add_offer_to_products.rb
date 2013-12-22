class AddOfferToProducts < ActiveRecord::Migration
  def change
    add_column :products, :offer, :string
  end
end
