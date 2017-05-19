class ChangeViewsToHasDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column_default :notes, :views, 0
  end
end
