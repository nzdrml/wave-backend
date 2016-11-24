class ApplicationController < ActionController::Base
  protect_from_forgery :with => :exception



  protected

  def succeed_to route
    redirect_to route, :notice => 'Success!'
  end

  def error_to template
    self.error
    render template
  end

  def error
    error_message = ''

    if @form
      @form.errors.each do |attribute, message|
        error_message << "#{attribute.to_s.humanize} #{message}<br>"
      end
    else
      error_message = 'An Error Occured.'
    end

    flash.now[:error] = error_message
  end
end
