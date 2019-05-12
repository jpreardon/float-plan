class BoatsController < ApplicationController
  
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
  
  private
  
    def boat_params
      params.require(:boat).permit( :number,
                                    :name,
                                    :note)
    end
end