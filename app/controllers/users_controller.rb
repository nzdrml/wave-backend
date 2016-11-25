class UsersController < ApplicationController

  decorates_assigned :user, :users

  def index
    @users = User.alphabetical
  end

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

  def top_up
    user = User.find_by_id params[:id]
    amount = params[:amount].to_i

    user && user.top_up(amount) ?
      self.succeed_to(:users) :
      self.error_to(:users)
  end

end
