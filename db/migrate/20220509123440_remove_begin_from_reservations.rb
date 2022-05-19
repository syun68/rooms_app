class RemoveBeginFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :begin, :datetime
  end
end
