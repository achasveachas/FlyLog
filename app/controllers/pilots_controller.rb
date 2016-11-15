class PilotsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @pilot = Pilot.new
  end

  def create
    @pilot = Pilot.new(pilot_params)
    if @pilot.save
      redirect_to pilot_path(@pilot)
    else
      render :new
    end
  end

  def edit
    @pilot = Pilot.find(params[:id])
  end

  def update
    @pilot = Pilot.find(params[:id])
    @pilot.update_attributes(pilot_params)
    redirect_to pilot_path(@pilot)
  end

  def destroy
  end

  private

  def pilot_params
    params.require(:pilot).permit(:name, :email, :password, :password_confirmation, :age, :rating_ids => [])
  end
end
