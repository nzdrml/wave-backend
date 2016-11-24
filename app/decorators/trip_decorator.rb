class TripDecorator < Draper::Decorator

  delegate_all

  decorates_association :driver
  decorates_association :route
  decorates_association :schedule

  def to_s
    self.route
  end

  def trip_date
    "#{object.trip_date} #{self.schedule}"
  end

end
