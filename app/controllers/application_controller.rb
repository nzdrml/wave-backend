class ApplicationController < ActionController::Base
  protect_from_forgery :with => :exception



  protected

  def error
    error_message = ''

    @form.errors.each do |attribute, message|
      error_message << "#{attribute.to_s.humanize} #{message}<br>"
    end

    flash.now[:error] = error_message
  end
end
