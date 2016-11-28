class BookingDecorator < Draper::Decorator

  delegate_all


  decorates_association :trip
  decorates_association :rider

  def phone
    self.rider.phone
  end

  def balance
    helper.number_to_currency object.balance, :precision => 2, :unit => 'Php '
  end

  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end

end
