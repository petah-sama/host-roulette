class AddEditionsToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_reference :notifications, :edition, foreign_key: true
  end
end
