class RouteForm < Reform::Form

  properties :origin_id, :destination_id, :price, :schedule_ids

  validates :origin_id, :destination_id, :price, :presence => true

end
