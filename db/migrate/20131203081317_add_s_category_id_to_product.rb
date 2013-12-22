class AddSCategoryIdToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :category, index: true
    add_reference :products, :subcategory, index: true
  end
end
