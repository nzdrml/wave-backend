class ScheduleDecorator < Draper::Decorator

  delegate_all

  def to_s
    object.time
  end

end
