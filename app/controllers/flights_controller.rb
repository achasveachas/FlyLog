class FlightsController < ApplicationController
  def index
  end

  def show
    @pilot = Pilot.find_by(id: params[:pilot_id])
    @flight = Flight.find_by(id: params[:id])
  end

  def new
    @pilot = Pilot.find_by(id: params[:pilot_id])
    if !can_edit?
      flash[:notice] = "You do not have permission to edit this page"
      redirect_to :back
    else
      @flight = @pilot.flights.new
      @flight_airplanes = @flight.flight_airplanes.build
      @airplane = @flight_airplanes.build_airplane
    end
  end

  def create
    @pilot = Pilot.find_by(id: params[:pilot_id])
    if can_edit?
      @flight = @pilot.log_books.first.flights.new(flight_params)
      @flight.flight_airplanes.last.flight = @flight
      @flight.update_duration(params[:flight][:hours], params[:flight][:minutes])
      if @flight.save!
        redirect_to pilot_path(@flight.pilot)
      else
        raise @flight.errors.inspect
      end
    else
      flash[:notice] = "You do not have permission to edit this page"
      redirect_to :back
    end
  end

  def edit
    @pilot = Pilot.find_by(id: params[:pilot_id])
    @flight = Flight.find_by(id: params[:id])
    if !can_edit?
      flash[:notice] = "You do not have permission to edit this page"
      redirect_to :back
    end
  end

  def update
    @pilot = Pilot.find_by(id: params[:pilot_id])
    @flight = Flight.find_by(id: params[:id])
    if !can_edit?
      flash[:notice] = "You do not have permission to edit this page"
      redirect_to :back
    else
      @flight.update_attributes(flight_params)
      @flight.update_duration(params[:flight][:hours], params[:flight][:minutes])
      @flight.save
      redirect_to pilot_flight_path(@pilot, @flight)
    end
  end

  def destroy
    @pilot = Pilot.find_by(id: params[:pilot_id])
    @flight = Flight.find_by(id: params[:id])
    if can_edit?
      @flight.destroy
      redirect_to pilot_path(@pilot)
    else
      flash[:notice] = "You can not delete this flight"
      redirect_to :back
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:date, :origin, :destination, :notes, :instructor, flight_airplanes_attributes: [:tail_number, airplane_attributes: [:make, :model]])
  end
end
