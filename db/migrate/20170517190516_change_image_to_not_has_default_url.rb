class ChangeImageToNotHasDefaultUrl < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :image, nil
  end
end
