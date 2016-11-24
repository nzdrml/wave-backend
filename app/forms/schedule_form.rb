require 'reform/form/validation/unique_validator'

class ScheduleForm < Reform::Form

  property :time

  validates :time,
    :presence => true,
    :unique => true,
    :format => /\A(?:\d|[01]\d|2[0-3]):[0-5]\d\z/


  def time= value
    self.sanitize_time value
    super value
  end



  protected

  # Adds/Removes leading 0s for standardization
  def sanitize_time value
    unless value.length > 5 && value[0] == '0'
      value.prepend '0' if value.length == 4
      return value
    end
    value[0] = ''
    self.sanitize_time value
  end

end
