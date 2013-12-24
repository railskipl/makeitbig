class AddDetailsToStores < ActiveRecord::Migration
  def change
    add_column :stores, :meta_keywords, :string
    add_column :stores, :meta_desc, :text
  end
end
