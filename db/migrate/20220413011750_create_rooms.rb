class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :area
      t.datetime :begin
      t.datetime :finish
      t.integer :number_of_guests

      t.timestamps
    end
  end
end
