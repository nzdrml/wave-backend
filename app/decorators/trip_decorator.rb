class TripDecorator < Draper::Decorator

  decorates_association :driver
  decorates_association :route
  decorates_association :schedule

  def to_s
    "#{self.schedule} - #{self.route}"
  end

end
