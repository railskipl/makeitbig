class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :city
      t.integer :store_id

      t.timestamps
    end
  end
end
