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
      @flight_airplane = @flight.build_flight_airplane
      @airplane = @flight_airplane.build_airplane
    end
  end

  def create
    @pilot = Pilot.find_by(id: params[:pilot_id])
    if can_edit?
      @flight = @pilot.log_book.flights.create(flight_params)
      @flight.flight_airplane.flight = @flight
      @flight.update_duration(params[:flight][:hours], params[:flight][:minutes])
      if @flight.save!
        redirect_to pilot_path(@flight.pilot)
      else
        render :new
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
    params.require(:flight).permit(:date, :origin, :destination, :notes, :instructor, flight_airplane_attributes: [:tail_number, airplane_attributes: [:make, :model]])
  end
end
