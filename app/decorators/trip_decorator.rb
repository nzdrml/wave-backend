class TripDecorator < Draper::Decorator

  delegate_all

  decorates_association :driver
  decorates_association :riders
  decorates_association :route
  decorates_association :schedule

  def to_s
    self.route
  end

  def trip_date
    "#{object.trip_date} #{self.schedule}"
  end

  def bg_class
    return 'bg-primary' if self.finished?
    return 'bg-success' if self.confirmed?
    return 'bg-warning' if self.started?
    return 'bg-danger' if self.cancelled?
    return ''
  end

  def price
    helper.number_to_currency(
      object.route.price,
      :precision => 2,
      :unit => 'Php '
    )
  end

  def get_balance_for_rider rider
    helper.number_to_currency(
      object.get_balance_for_rider(rider),
      :precision => 2,
      :unit => 'Php '
    )
  end

  def revenue
    helper.number_to_currency object.balance, :precision => 2, :unit => 'Php '
  end

  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end

end
