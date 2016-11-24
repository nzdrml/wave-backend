class TripsController < ApplicationController

  decorates_assigned :trip, :trips

  def index
    @trips = Trip.by_date
  end

  def upcoming
    @trips = Trip.active.by_earliest
  end

  def new
    @form = TripForm.new Trip.new
  end

  def create
    @form = TripForm.new Trip.new

    if @form.validate params[:trip]
      @form.save

      self.succeed_to :trips
    else
      self.error_to :new
    end
  end

  def edit
    @form = TripForm.new Trip.find params[:id]
  end

  def update
    @form = TripForm.new Trip.find params[:id]

    if @form.validate params[:trip]
      @form.save
      self.succeed_to :trips
    else
      self.error_to :edit
    end
  end

  def destroy
    trip = Trip.find_by_id params[:id]
    trip && trip.destroy ? self.succeed_to(:trips) : self.error_to(:index)
  end

  def confirm
    trip = Trip.find_by_id params[:id]
    trip && trip.confirmed! ?
      self.succeed_to([:upcoming, :trips]) :
      self.error_to(:index)
  end

  def cancel
    trip = Trip.find_by_id params[:id]
    trip && trip.cancelled! ? self.succeed_to(:trips) : self.error_to(:index)
  end

end
