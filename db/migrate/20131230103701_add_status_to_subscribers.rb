class AddStatusToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :status, :boolean
  end
end
