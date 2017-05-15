class AddIsDraftToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :is_draft, :boolean, default: false, null: false
  end
end
