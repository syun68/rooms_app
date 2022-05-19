class CreateAddTotalFeeToReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :add_total_fee_to_reservations do |t|
      t.integer :total_fee

      t.timestamps
    end
  end
end
