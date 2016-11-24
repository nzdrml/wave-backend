class UsersController < ApplicationController

  def new
    @form = UserForm.new User.new
  end

  def create
    @form = UserForm.new User.new

    if @form.validate params[:user]
      @form.save

      self.succeed_to :users
    else
      self.error_to :new
    end
  end

  def edit
    @form = UserForm.new User.find params[:id]
  end

  def update
    @form = UserForm.new User.find params[:id]

    if @form.validate params[:user]
      @form.save
      self.succeed_to :users
    else
      self.error_to :edit
    end
  end

  def destroy
    user = User.find_by_id params[:id]
    user && user.destroy ? self.succeed_to(:users) : self.error_to(:index)
  end

end
