class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :object_id
      t.integer :category, default: 0

      t.timestamps
    end
  end
end
