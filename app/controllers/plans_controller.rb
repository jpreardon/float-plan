class PlansController < ApplicationController
  before_action :logged_in_user
  
  def new
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.create(plan_params)
    if @plan.save
      flash[:success] = 'Float plan added'
      redirect_to plans_path
    else
      render 'new'
    end
  end
  
  private
    
    def plan_params
      params.require(:plan).permit( :time_out,
                                    :weather_forecast,
                                    :current,
                                    :direction,
                                    :checkout_complete,
                                    :notes_out,
                                    :time_in,
                                    :checkin_complete,
                                    :notes_in)
    end
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = 'Please log in.'
        redirect_to login_url
      end
    end
    
end
