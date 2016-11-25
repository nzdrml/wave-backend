class UserDecorator < Draper::Decorator

  delegate_all

  def to_s
    "#{object.first_name} #{object.last_name}"
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
