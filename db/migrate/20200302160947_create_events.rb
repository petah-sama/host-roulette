class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.integer :budget, null: false
      t.string :frequency, null: false
      t.float :avg_rating

      t.timestamps
    end
  end
end
