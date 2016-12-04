class IndexController < ApplicationController
  skip_before_action :require_login
  
  def home
    if current_pilot
      redirect_to pilot_path(current_pilot)
    end
  end
end
