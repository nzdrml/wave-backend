class Vehicle < ApplicationRecord

  before_save :remove_other_vehicles

  belongs_to :driver, :class_name => 'User', :optional => true



  private

  def remove_other_vehicles
    driver_id = self.driver_id
    Vehicle.where(:driver_id => self.driver_id).each do |vehicle|
      vehicle.update_attribute :driver_id, nil
    end
    self.driver_id = driver_id
  end

end
