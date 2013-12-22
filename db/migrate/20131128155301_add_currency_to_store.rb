class AddCurrencyToStore < ActiveRecord::Migration
  def change
    add_column :stores, :currency, :string, :default => "Rs."
  end
end
