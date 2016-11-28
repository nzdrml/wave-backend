class VehicleDecorator < Draper::Decorator

  delegate_all


  def to_s
    "#{object.make} - #{object.plate}"
  end

end
