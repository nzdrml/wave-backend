class CreateJoinTableRouteSchedule < ActiveRecord::Migration[5.0]
  def change
    create_join_table :routes, :schedules do |t|
      t.index [:route_id, :schedule_id]
      t.index [:schedule_id, :route_id]
    end
  end
end
