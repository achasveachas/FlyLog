class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_pilot, :can_edit?
  before_action :require_login

  private

  def login(pilot)
    session[:pilot_id] = pilot.id
  end

  def log_out
    session[:pilot_id] = nil
  end

  def current_pilot
    @current_pilot ||= Pilot.find_by(id: session[:pilot_id]) unless session[:pilot_id] == nil
  end

  def can_edit?
    current_pilot && (current_pilot.admin || @pilot == current_pilot)
  end

  def require_login
    unless current_pilot
      flash[:notice] = "You must be logged in to access this section"
      redirect_to root_path
    end
  end

end
