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
  
  def index
    @plans = Plan.all
  end
  
  def show
    @plan = Plan.find(params[:id])
  end
  
  def edit
    @plan = Plan.find(params[:id])
  end
  
  def update
    @plan = Plan.find(params[:id])
    if @plan.update_attributes(plan_params)
      flash[:success] = 'Plan updated'
      redirect_to plan_path(@plan)
    else
      render 'edit'
    end
  end
  
  def destroy
    Plan.find(params[:id]).destroy
    flash[:success] = 'Plan deleted'
    redirect_to plans_path
  end
  
  private
    
    def plan_params
      params.require(:plan).permit( :date,
                                    :time_out,
                                    :weather_forecast,
                                    :current,
                                    :direction,
                                    :checkout_complete,
                                    :notes_out,
                                    :time_in,
                                    :checkin_complete,
                                    :notes_in,
                                    :boat_id)
    end
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = 'Please log in.'
        redirect_to login_url
      end
    end
    
end
