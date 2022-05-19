class RemoveAdressFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :adress, :string
  end
end
