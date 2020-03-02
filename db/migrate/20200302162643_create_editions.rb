class CreateEditions < ActiveRecord::Migration[5.2]
  def change
    create_table :editions do |t|
      t.references :event, foreign_key: true
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.integer :host_id
      t.string :start_address
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :notes
      t.integer :status, default: 0
      t.float :avg_rating

      t.timestamps
    end
  end
end
