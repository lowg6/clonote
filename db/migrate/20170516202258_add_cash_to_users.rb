class AddCashToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cash, :integer, default: 0, null: false
  end
end
