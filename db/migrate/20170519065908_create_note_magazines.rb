class CreateNoteMagazines < ActiveRecord::Migration[5.0]
  def change
    create_table :note_magazines do |t|
      t.references :note, index: true, foreign_key: true
      t.references :magazine, index: true, foreign_key: true

      t.timestamps
    end
  end
end
