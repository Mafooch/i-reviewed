class SessionsController < ApplicationController
  def new
    # Login Page - new.html.erb
  end

  def create
    reviewer = Reviewer.find_by(name: params[:reviewer][:name])
    password = params[:reviewer][:password]
    # not using strong params

    if reviewer && reviewer.authenticate(password)
      # this methodology seems to assume a uniqueness constraint on reviewer names
      # which makes sense. otherwise, theoretically the same pass and name combo
      # could log someone into totally different accounts
      session[:reviewer_id] = reviewer.id
      # don't want to store alot in session, esp sensitive info. just wanna use
      # their id to look up info to preserve some state for them
      redirect_to root_path, notice: "Logged in successfully"
    else
      redirect_to login_path, alert: "Invalid username/password combination"
    end
  end

  def destroy
    reset_session # wipe out session and everything in it
    # rails helper to wipe out the connection between browser and server
    redirect_to login_path, notice: "You have been logged out"
  end
end
