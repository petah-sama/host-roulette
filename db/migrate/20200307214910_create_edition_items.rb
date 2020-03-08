class CreateEditionItems < ActiveRecord::Migration[5.2]
  def change
    create_table :edition_items do |t|
      t.references :edition, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
