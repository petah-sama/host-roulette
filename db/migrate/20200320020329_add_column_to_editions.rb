class AddColumnToEditions < ActiveRecord::Migration[5.2]
  def change
    add_column :editions, :host_avg_rating, :float, default: 0
  end
end
