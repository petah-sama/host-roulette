class CreateBillings < ActiveRecord::Migration[5.2]
  def change
    create_table :billings do |t|
      t.string :state
      t.string :edition_sku
      t.monetize :amount, currency: { present: false }
      t.string :checkout_session_id
      t.references :user, foreign_key: true
      t.references :edition, foreign_key: true

      t.timestamps
    end
  end
end
