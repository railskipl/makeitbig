class AddImageIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :product_image_id, :integer
  end
end
