class AddMagazineIdToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :magazine_id, :integer
  end
end
