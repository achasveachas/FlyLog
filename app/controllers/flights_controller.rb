class FlightsController < ApplicationController
  def index
  end

  def show
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
      if @flight.save
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
  end

  def update
  end

  def destroy
  end

  private

  def flight_params
    params.require(:flight).permit(:date, :origin, :destination, :notes, :instructor, :hours, :minutes, flight_airplanes_attributes: [:tail_number, airplane_attributes: [:make, :model]])
  end
end
