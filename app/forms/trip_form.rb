class TripForm < Reform::Form

  properties :driver_id, :route_id, :schedule_id, :trip_date

  validates :driver_id, :route_id, :schedule_id, :trip_date, :presence => true

end
