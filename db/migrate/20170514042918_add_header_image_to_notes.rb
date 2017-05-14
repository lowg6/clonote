class AddHeaderImageToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :header_image, :string
  end
end
