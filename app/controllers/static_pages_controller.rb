class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:float_plans, :new_float_plan]
  
  def home
  end
  
  def float_plans
  end
  
  def new_float_plan
  end
  
  private
  
    def logged_in_user
      unless logged_in?
        flash[:danger] = 'Please log in.'
        redirect_to login_url
      end
    end
end
