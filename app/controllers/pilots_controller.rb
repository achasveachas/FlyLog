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
      raise @pilot.inspect
    else
      raise "error"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def pilot_params
    params.require(:pilot).permit(:name, :email, :password, :password_confirmation, :age, :rating_ids => [])
  end
end
