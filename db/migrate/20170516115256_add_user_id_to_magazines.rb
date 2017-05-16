class AddUserIdToMagazines < ActiveRecord::Migration[5.0]
  def change
    add_column :magazines, :user_id, :integer
  end
end
