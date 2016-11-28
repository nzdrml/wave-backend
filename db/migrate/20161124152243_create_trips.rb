class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.references :driver, :index => true
      t.references :route, :index => true, :null => false
      t.references :schedule, :index => true, :null => false
      t.integer :state, :default => 0
      t.decimal :balance, :precision => 8, :scale => 2, :default => 0

      t.timestamps
    end
  end
end
