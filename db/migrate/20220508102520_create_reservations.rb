class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.datetime :begin
      t.datetime :finish
      t.integer :number_of_guests
      t.integer :fee
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
