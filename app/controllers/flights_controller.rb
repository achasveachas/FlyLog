class FlightsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @pilot = Pilot.find_by(id: params[:pilot_id])
    if !can_edit?
      flash[:notice] = "You do not have permission to edit this page"
      redirect_to root_path
    else
      @flight = @pilot.flights.new
      @flight_airplane = @flight.flight_airplanes.build
      @airplane = @flight_airplane.build_airplane
    end
  end

  def create
    @pilot = Pilot.find_by(id: params[:pilot_id])
    @flight = @pilot.log_books.first.flights.new(flight_params)
    if @flight.save
      redirect_to pilot_path(@flight.pilot)
    else
      raise @flight.inspect
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def flight_params
    params.require(:flight).permit(:date, :origin, :destination, :notes, :instructor)
  end
end
