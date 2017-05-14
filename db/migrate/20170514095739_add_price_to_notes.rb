class AddPriceToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :price, :integer, default: 0
  end
end
