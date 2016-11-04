class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.decimal :price, :precision => 8, :scale => 2, :default => 0

      t.references :origin, :null => false, :index => true
      t.references :destination, :null => false, :index => true
    end
  end
end
