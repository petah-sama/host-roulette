class AddSkuToEditions < ActiveRecord::Migration[5.2]
  def change
    add_column :editions, :sku, :string
  end
end
