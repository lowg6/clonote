class CreateMagazines < ActiveRecord::Migration[5.0]
  def change
    create_table :magazines do |t|
      t.string :title
      t.text :description
      t.integer :price, default: 0
      t.boolean :is_public, default: false, null: false
      
      t.timestamps
    end
  end
end
