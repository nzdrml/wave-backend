# == Schema Information
#
# Table name: trips
#
#  id          :integer          not null, primary key
#  driver_id   :integer
#  route_id    :integer          not null
#  schedule_id :integer          not null
#  state       :integer          default("pending")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Trip < ApplicationRecord

  include Balanceable


  before_destroy :refund_riders!


  enum :state => [:pending, :confirmed, :started, :finished, :cancelled]

  has_many :bookings, :dependent => :destroy
  has_many :riders, :through => :bookings

  belongs_to :driver, :class_name => 'User'
  belongs_to :route
  belongs_to :schedule

  scope :by_date, -> { order :trip_date => :desc }
  scope :by_earliest, -> { joins(:schedule).order('schedules.time ASC') }
  scope :active, -> { where :state => [:pending, :confirmed, :started] }


  def get_balance_for_rider rider
    return unless self.riders.include? rider
    booking = Booking.where :trip_id => self.id, :rider_id => rider.id
    return unless booking.any?
    booking.first.balance
  end

  def confirm!
    self.bookings.each &:debit_rider!
    self.confirmed!
  end

  def cancel!
    self.refund_riders!
    self.bookings.destroy_all
    self.cancelled!
  end



  protected

  def refund_riders!
    return if self.pending? || self.finished? || self.cancelled?
    self.bookings.each &:refund_rider!
  end

end
