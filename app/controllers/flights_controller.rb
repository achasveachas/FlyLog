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
    end
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
