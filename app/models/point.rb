# == Schema Information
#
# Table name: points
#
#  id        :integer          not null, primary key
#  name      :string           not null
#  latitude  :float
#  longitude :float
#

class Point < ApplicationRecord
end
