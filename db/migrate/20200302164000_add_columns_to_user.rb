class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :date_of_birth, :date
    add_column :users, :host_avg_rating, :float
  end
end
