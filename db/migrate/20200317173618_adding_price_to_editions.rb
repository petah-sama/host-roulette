class AddingPriceToEditions < ActiveRecord::Migration[5.2]
  def change
    add_monetize :editions, :price, currency: { present: false }
  end
end
