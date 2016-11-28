class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :make, :null => false
      t.string :plate, :null => false

      t.references :driver
    end
  end
end
