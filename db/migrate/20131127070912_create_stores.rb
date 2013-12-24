class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :owner_name
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :phone
      t.references :user, index: true

      t.timestamps
    end
  end
end
