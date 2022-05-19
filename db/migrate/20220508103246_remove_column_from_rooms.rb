class RemoveColumnFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :begin, :integer
    remove_column :rooms, :finish, :integer
    remove_column :rooms, :number_of_guests, :integer
  end
end
