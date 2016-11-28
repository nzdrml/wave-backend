class BookingsController < ApplicationController

  def collect_balance
    booking = Booking.find_by_id params[:id]
    booking && booking.debit_rider! ?
      self.succeed_to([:accounts_payable, :users]) :
      self.error_to(:accounts_payable)
  end

end
