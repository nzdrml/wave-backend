require 'reform/form/validation/unique_validator'

class ScheduleForm < Reform::Form

  property :time

  validates :time,
    :presence => true,
    :unique => true,
    :format => /\A(?:\d|[01]\d|2[0-3]):[0-5]\d\z/


  def time= value
    # Removes leading 0s from time format for uniformity.
    value[0] = '' if value[0] == '0'
    super value
  end

end
