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

  def create_oauth
    if @pilot = Pilot.find_by(email: request.env['omniauth.auth']['info']['email'])
      login(@pilot)
      redirect_to pilot_path(@pilot)
    else
      @pilot = Pilot.create(email: request.env['omniauth.auth']['info']['email'], name: request.env['omniauth.auth']['info']['name'], password: "randompassword", password_confirmation: "randompassword")
      login(@pilot)
      redirect_to edit_pilot_path(@pilot)
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end
end
