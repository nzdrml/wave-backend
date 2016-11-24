class TripForm < Reform::Form

  properties :driver_id, :route_id, :schedule_id

  validates :driver_id, :route_id, :schedule_id, :presence => true

end
