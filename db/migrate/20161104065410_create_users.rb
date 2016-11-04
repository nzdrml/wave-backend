class CreateUsers < ActiveRecord::Migration[5.0]
  create_table :users do |t|
    t.string :first_name, :null => false
    t.string :last_name, :null => false
    t.string :phone, :null => false

    t.timestamps :null => false
  end
end
