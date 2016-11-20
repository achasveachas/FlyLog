class IndexController < ApplicationController
  def home
    if current_pilot
      redirect_to pilot_path(current_pilot)
    end
  end
end
