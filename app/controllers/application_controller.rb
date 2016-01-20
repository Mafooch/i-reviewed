class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_login
  helper_method :logged_in?, :current_user
  # by setting these as helper methods like this they are available not just
  # to the views as we're accustomed to with what's in the helpers directory,
  # but in the controller as well

  # how we lock down the app so the pages aren't accessible until you Login
  protected
  # unlike private, this will allow the other controllers to inherit
    def ensure_login
      # always go to login page unless session contains reviewer_id
      redirect_to login_path unless session[:reviewer_id]
    end

    def logged_in?
      session[:reviewer_id] # nil is false
    end

    def current_user
      @current_user ||= Reviewer.find session[:reviewer_id]
      # caches current_user instance variable for this particular request, not
      # in between requests
      # current_user is an instance variable of the ApplicationController which
      # the other controllers inherit from. also accessible in views. called
      # simply with current_user
    end
end
