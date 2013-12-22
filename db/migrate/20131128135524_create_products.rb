class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.boolean :is_available, :default => true
      t.boolean :warranty, :default => true
      t.references :user, index: true
      t.references :store, index: true

      t.timestamps
    end
  end
end
