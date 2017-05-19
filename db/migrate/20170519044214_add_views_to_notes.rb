class AddViewsToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :views, :integer, null: false
  end
end
