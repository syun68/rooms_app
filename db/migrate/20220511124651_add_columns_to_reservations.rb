class AddColumnsToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :image, :string
    add_column :reservations, :name, :string
    add_column :reservations, :introduction, :string
    add_column :reservations, :total_fee, :integer
  end
end
