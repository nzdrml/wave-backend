# == Schema Information
#
# Table name: routes
#
#  id             :integer          not null, primary key
#  price          :decimal(8, 2)    default(0.0)
#  origin_id      :integer          not null
#  destination_id :integer          not null
#

class Route < ApplicationRecord

  belongs_to :origin, :class_name => 'Point'
  belongs_to :destination, :class_name => 'Point'

  has_and_belongs_to_many :schedules
  
end
