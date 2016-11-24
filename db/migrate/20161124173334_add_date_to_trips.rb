class AddDateToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :trip_date, :date, :null => false
  end
end
