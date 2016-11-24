class SchedulesController < ApplicationController

  def new
    @form = ScheduleForm.new Schedule.new
  end

  def create
    @form = ScheduleForm.new Schedule.new

    if @form.validate params[:schedule]
      @form.save

      self.succeed_to :schedules
    else
      self.error_to :new
    end
  end

  def edit
    @form = ScheduleForm.new Schedule.find params[:id]
  end

  def update
    @form = ScheduleForm.new Schedule.find params[:id]

    if @form.validate params[:schedule]
      @form.save
      self.succeed_to :schedules
    else
      self.error_to :edit
    end
  end

  def destroy
    schedule = Schedule.find_by_id params[:id]
    schedule && schedule.destroy ?
      self.succeed_to(:schedules) :
      self.error_to(:index)
  end

end
