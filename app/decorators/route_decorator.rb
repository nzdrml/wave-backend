class RouteDecorator < Draper::Decorator

  delegate_all

  def to_s
    "#{object.origin.name} to #{object.destination.name}"
  end

end
