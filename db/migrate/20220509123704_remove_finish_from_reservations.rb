class RemoveFinishFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :finish, :datetime
  end
end
