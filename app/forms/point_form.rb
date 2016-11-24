class PointForm < Reform::Form

  properties :name, :latitude, :longitude

  validates :name, :presence => true
  validates_uniqueness_of :name

end
