class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.references :member, foreign_key: true
      t.references :edition, foreign_key: true

      t.timestamps
    end
  end
end
