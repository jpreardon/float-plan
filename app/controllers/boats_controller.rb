class BoatsController < ApplicationController
  
  def new
    @boat = Boat.new
  end

end
