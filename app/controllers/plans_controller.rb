class PlansController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user_or_admin, only: [:edit, :update, :destroy]
  before_action :skipper_or_admin_user, only: [:create]
  
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
      if @plan.checkin_complete
        flash[:success] = 'Plan completed'
      else
        flash[:success] = 'Plan updated'
      end
      redirect_to plan_path(@plan)
    else
      render 'edit'
    end
  end
  
  def destroy
    @plan = Plan.find(params[:id])
    # Only admins can destroy complete plans
    if @plan.checkin_complete && !current_user.admin?
      flash[:danger] = 'Completed plans can not be deleted'
      redirect_to plan_path(@plan)
    else
      @plan.destroy
      flash[:success] = 'Plan deleted'
      redirect_to plans_path
    end
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
                                    :boat_id,
                                    :skipper_id,
                                    { crew_ids: [] },
                                    :guests)
    end
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = 'Please log in.'
        redirect_to login_url
      end
    end
    
    def correct_user_or_admin
      @plan = Plan.find_by(id: params[:id])
      redirect_to root_url unless current_user.admin? || @plan.skipper == current_user
    end
    
    def skipper_or_admin_user
      redirect_to root_url unless current_user.skipper? || current_user.admin?
    end
end
