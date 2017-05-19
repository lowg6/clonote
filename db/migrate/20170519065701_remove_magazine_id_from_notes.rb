class RemoveMagazineIdFromNotes < ActiveRecord::Migration[5.0]
  def change
    remove_column :notes, :magazine_id
  end
end
