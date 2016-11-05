class Route < ApplicationRecord

  belongs_to :origin, :class_name => 'Point'
  belongs_to :destination, :class_name => 'Point'

  has_and_belongs_to_many :schedules
  
end
