class RemoveEditionIdFromItemsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :edition_id, :bigint
  end
end
