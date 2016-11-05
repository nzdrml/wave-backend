class AddRolesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :role
  end
end
