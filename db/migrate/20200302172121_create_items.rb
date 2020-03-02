class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :edition, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
