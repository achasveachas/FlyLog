class SessionsController < ApplicationController
  def new
  end

  def create
    @pilot = Pilot.find_by(email: params[:pilot][:email])
    if !!@pilot && @pilot.authenticate(params[:pilot][:password])
      login(@pilot)
      redirect_to pilot_path(@pilot)
    else
      flash[:notice] = "Invalid email address or password."
      redirect_to signin_path
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end
end
