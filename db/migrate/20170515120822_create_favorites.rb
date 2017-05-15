class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :note_id

      t.timestamps
    end
    
    add_index :favorites, :user_id
    add_index :favorites, :note_id
    add_index :favorites, [:user_id, :note_id], unique: true
  end
end
