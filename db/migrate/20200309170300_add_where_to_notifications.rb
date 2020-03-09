class AddWhereToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :from, :integer, default: 0
  end
end
