# == Schema Information
#
# Table name: schedules
#
#  id   :integer          not null, primary key
#  time :string           default("06:30"), not null
#

class Schedule < ApplicationRecord

  has_and_belongs_to_many :routes

end
