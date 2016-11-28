class VehiclesController < ApplicationController

  def new
    @form = VehicleForm.new Vehicle.new
  end

  def create
    @form = VehicleForm.new Vehicle.new

    if @form.validate params[:vehicle]
      @form.save

      self.succeed_to :vehicles
    else
      self.error_to :new
    end
  end

  def edit
    @form = VehicleForm.new Vehicle.find params[:id]
  end

  def update
    @form = VehicleForm.new Vehicle.find params[:id]

    if @form.validate params[:vehicle]
      @form.save
      self.succeed_to :vehicles
    else
      self.error_to :edit
    end
  end

  def destroy
    vehicle = Vehicle.find_by_id params[:id]
    vehicle && vehicle.destroy ?
      self.succeed_to(:vehicles) :
      self.error_to(:index)
  end

end
