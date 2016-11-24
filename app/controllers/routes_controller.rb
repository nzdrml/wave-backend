class RoutesController < ApplicationController

  def new
    @form = RouteForm.new Route.new
  end

  def create
    @form = RouteForm.new Route.new

    if @form.validate params[:route]
      @form.save

      self.succeed_to :routes
    else
      self.error_to :new
    end
  end

  def edit
    @form = RouteForm.new Route.find params[:id]
  end

  def update
    @form = RouteForm.new Route.find params[:id]

    if @form.validate params[:route]
      @form.save
      self.succeed_to :routes
    else
      self.error_to :edit
    end
  end

  def destroy
    route = Route.find_by_id params[:id]
    route && route.destroy ? self.succeed_to(:routes) : self.error_to(:index)
  end
end
