class AddUserToProductImages < ActiveRecord::Migration
  def change
    add_reference :product_images, :user, index: true
  end
end
