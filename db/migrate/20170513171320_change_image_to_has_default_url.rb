class ChangeImageToHasDefaultUrl < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :image, :string, default: 'https://s3-ap-northeast-1.amazonaws.com/mxi/uploads/default_profile.png'
  end
end
