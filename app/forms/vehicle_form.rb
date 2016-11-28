class VehicleForm < Reform::Form

  properties :make, :plate, :driver_id

  validates :make, :plate, :presence => true

end
