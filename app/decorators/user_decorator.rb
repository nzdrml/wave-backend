class UserDecorator < Draper::Decorator

  delegate_all

  def to_s
    "#{object.first_name} #{object.last_name}"
  end

end
