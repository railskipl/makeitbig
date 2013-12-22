class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :plan, index: true, :default => "1"
  end
end
