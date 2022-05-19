class AddDetailsToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :name, :string
    add_column :rooms, :introduction, :string
    add_column :rooms, :fee, :integer
    add_column :rooms, :adress, :string
    add_column :rooms, :image, :string
  end
end
