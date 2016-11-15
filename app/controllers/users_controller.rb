class UsersController < ApplicationController

  def new
    @model = User.new
    @form = UserForm.new @model
  end

  def create
    @model = User.new
    @form = UserForm.new @model

    if @form.validate params[:user]
      @form.save

      render :index
    else
      render :new
    end
  end

  def edit
    @model = User.find params[:id]
    @form = UserForm.new @model
  end

  def update
    @model = User.find params[:id]
    @form = UserForm.new @model

    if @form.validate params[:user]
      @form.save

      render :index
    else
      self.error
      render :edit
    end
  end

end
