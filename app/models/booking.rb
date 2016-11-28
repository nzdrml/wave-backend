class Booking < ApplicationRecord

  include Balanceable


  before_create :set_balance_from_trip


  belongs_to :rider, :class_name => 'User'
  belongs_to :trip


  scope :with_remaining_balance, -> do
    joins(:trip).
      where(:trips => {:state => [1,2,3]}).
      where 'bookings.balance > ?', 0
  end


  def set_balance_from_trip
    return unless self.trip
    self.set_balance self.trip.route.price
  end

  def debit_rider!
    if self.rider.balance >= self.balance
      self.rider.debit! self.balance
      self.trip.credit! self.balance
      self.set_balance! 0
    else
      self.debit! self.rider.balance
      self.trip.credit! self.rider.balance
      self.rider.set_balance! 0
    end
  end

  def refund_rider!
    amount = self.trip.route.price - self.balance
    self.rider.credit! amount
    self.trip.debit! amount
  end

end
