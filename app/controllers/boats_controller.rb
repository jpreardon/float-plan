class BoatsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
  
  def new
    @boat = Boat.new
  end
  
  def create
    @boat = Boat.create(boat_params)
    if @boat.save
      flash[:success] = "Boat number #{@boat.number} added!"
      redirect_to @boat
    else
      render 'new'
    end
  end
  
  def show
    @boat = Boat.find(params[:id])
  end
  
  def edit
    @boat = Boat.find(params[:id])
  end
  
  def update
    @boat = Boat.find(params[:id])
    if @boat.update_attributes(boat_params)
      flash[:success] = "Boat number #{@boat.number} updated!"
      redirect_to @boat
    else
      render 'edit'
    end
  end
  
  def index
    @boats = Boat.all.order('CAST(number AS int)')
  end
  
  def destroy
    Boat.find(params[:id]).destroy
    flash[:success] = 'Boat deleted'
    redirect_to boats_path
  end

  private
  
    def boat_params
      params.require(:boat).permit( :number,
                                    :name,
                                    :note)
    end
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = 'Please log in.'
        redirect_to login_url
      end
    end
    
    def admin_user
      unless current_user.admin?
        flash[:danger] = 'Not authorized'
        redirect_to root_url
      end
    end
end