class AddPriceToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :price, :integer, null: false
  end
end
