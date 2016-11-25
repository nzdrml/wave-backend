class Booking < ApplicationRecord

  belongs_to :rider, :class_name => 'User'
  belongs_to :trip


  def set_balance_from_trip
    return unless self.trip
    self.balance = self.trip.route.price
  end

end
