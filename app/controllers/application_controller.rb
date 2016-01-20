class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_login
  # how we lock down the app so the pages aren't accessible until you Login
  protected
  # unlike private, this will allow the other controllers to inherit
    def ensure_login
      # always go to login page unless session contains reviewer_id
      redirect_to login_path unless session[:reviewer_id]
    end

end
