class CreateMagazineRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :magazine_relationships do |t|
      t.references :user, index: true
      t.references :magazine, index: true

      t.timestamps
    end

    add_index :magazine_relationships, [:user_id, :magazine_id], unique: true
  end
end
