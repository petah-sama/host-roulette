class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :guest, foreign_key: true
      t.float :edition_rating, null: false
      t.float :host_rating, null:false
      t.text :content

      t.timestamps
    end
  end
end
