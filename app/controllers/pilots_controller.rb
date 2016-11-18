class PilotsController < ApplicationController
  def index
  end

  def show
    @pilot = Pilot.find(params[:id])
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
      redirect_to root_path
    end
  end

  def update
    @pilot = Pilot.find(params[:id])
    @pilot.update(pilot_params)
    redirect_to pilot_path(@pilot)
  end

  def destroy
  end

  private

  def pilot_params
    params.require(:pilot).permit(:name, :email, :password, :password_confirmation, :age, :rating_ids => [])
  end
end
