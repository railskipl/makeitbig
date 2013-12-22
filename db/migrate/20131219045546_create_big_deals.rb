class CreateBigDeals < ActiveRecord::Migration
  def change
    create_table :big_deals do |t|
      t.string :name
      t.string :store_name
      t.string :email
      t.string :phone
      t.date :start_date
      t.date :end_date
      t.string :image
      t.text :message
      t.boolean :active, :default => false

      t.timestamps
    end
  end
end
