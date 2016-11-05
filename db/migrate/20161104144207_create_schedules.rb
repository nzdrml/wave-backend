class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.string :time, :null => false, :default => '06:30'
    end
  end
end
