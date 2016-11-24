class PointsController < ApplicationController

  def new
    @form = PointForm.new Point.new
  end

  def create
    @form = PointForm.new Point.new

    if @form.validate params[:point]
      @form.save

      self.succeed_to :points
    else
      self.error_to :new
    end
  end

  def edit
    @form = PointForm.new Point.find params[:id]
  end

  def update
    @form = PointForm.new Point.find params[:id]

    if @form.validate params[:point]
      @form.save
      self.succeed_to :points
    else
      self.error_to :edit
    end
  end

  def destroy
    point = Point.find_by_id params[:id]
    point && point.destroy ? self.succeed_to(:points) : self.error_to(:index)
  end

end
