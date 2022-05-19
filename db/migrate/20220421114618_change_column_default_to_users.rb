class ChangeColumnDefaultToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :image_name, from: nil, to: "default_user.jpg"
  end
end
