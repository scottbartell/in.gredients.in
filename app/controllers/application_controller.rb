class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from NotFoundError, with: :error_not_found

  private
  
  def error_not_found
    render template: 'errors/not_found'
  end
end
