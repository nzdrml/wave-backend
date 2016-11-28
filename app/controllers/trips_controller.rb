class TripsController < ApplicationController

  decorates_assigned :trip, :trips

  def index
    @trips = Trip.by_date
  end

  def show
    @trip = Trip.find_by_id params[:id]
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

      self.succeed_to @form
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

  def add_riders
    @users = User.alphabetical.decorate
    @trip = Trip.find_by_id params[:id]
  end

  def add_rider
    trip = Trip.find_by_id params[:id]
    booking = Booking.new :trip_id => params[:id], :rider_id => params[:user_id]
    booking.save ?
      self.succeed_to([:add_riders, trip]) :
      self.error_to(:index)
  end

  def remove_rider
    trip = Trip.find_by_id params[:id]
    rider = User.find_by_id params[:user_id]
    trip.riders.delete(rider) ?
      self.succeed_to([:add_riders, trip]) :
      self.error_to(:index)
  end

  def confirm
    trip = Trip.find_by_id params[:id]

    trip && trip.confirm! ?
      self.succeed_to(trip) :
      self.error_to(:index)
  end

  def cancel
    trip = Trip.find_by_id params[:id]
    trip && trip.cancel! ? self.succeed_to(trip) : self.error_to(:index)
  end

  def start
    trip = Trip.find_by_id params[:id]

    trip && trip.started! ?
      self.succeed_to(trip) :
      self.error_to(:index)
  end

  def finish
    trip = Trip.find_by_id params[:id]

    trip && trip.finished! ? self.succeed_to(trip) : self.error_to(:index)
  end

end
