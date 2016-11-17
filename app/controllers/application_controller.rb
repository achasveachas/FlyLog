class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_pilot

  private

  def login(pilot)
    session[:pilot_id] = pilot.id
  end

  def log_out
    session[:pilot_id] = nil
  end

  def current_pilot
    Pilot.find_by(id: session[:pilot_id])
  end

  def can_edit?
    current_pilot && (current_pilot.admin || @pilot == current_pilot)
  end
end
