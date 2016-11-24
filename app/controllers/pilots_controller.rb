class PilotsController < ApplicationController
  def index
    @pilots = Pilot.all
  end

  def show
    @pilot = Pilot.find(params[:id])
    @flights = @pilot.flights
  end

  def new
    @pilot = Pilot.new
  end

  def create
    @pilot = Pilot.new(pilot_params)
    if @pilot.save
      login(@pilot)
      redirect_to pilot_path(@pilot)
    else
      render :new
    end
  end

  def edit
    @pilot = Pilot.find(params[:id])
    if !can_edit?
      flash[:notice] = "You do not have permission to edit this page"
      redirect_to :back
    end
  end

  def update
    @pilot = Pilot.find(params[:id])
    if can_edit?
      @pilot.update(pilot_params)
      redirect_to pilot_path(@pilot)
    else
      flash[:notice] = "You do not have permission to edit this page"
      redirect_to :back
    end
  end

  def destroy
    @pilot = Pilot.find_by(id: params[:id])
    if current_pilot.admin && current_pilot != @pilot
      @pilot.destroy
      redirect_to pilots_path
    else
      flash[:notice] = "You can not delete this pilot"
      redirect_to :back
    end
  end

  private

  def pilot_params
    params.require(:pilot).permit(:name, :email, :password, :password_confirmation, :age, :rating_ids => [])
  end
end
