# == Schema Information
#
# Table name: trips
#
#  id          :integer          not null, primary key
#  driver_id   :integer
#  route_id    :integer          not null
#  schedule_id :integer          not null
#  state       :integer          default("unprocessed")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Trip < ApplicationRecord

  enum :state => [:pending, :confirmed, :finished, :cancelled]

  belongs_to :driver, :class_name => 'User'
  belongs_to :route
  belongs_to :schedule

end
