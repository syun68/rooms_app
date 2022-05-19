class AddColumnToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :begin, :date
    add_column :reservations, :finish, :date
  end
end
