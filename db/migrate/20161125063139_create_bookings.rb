class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :rider
      t.references :trip
      t.decimal :balance, :precision => 8, :scale => 2, :null => false

      t.timestamps
    end
  end
end
