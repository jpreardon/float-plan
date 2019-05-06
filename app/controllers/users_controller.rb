class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "#{@user.first_name} #{@user.last_name} added!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "#{@user.first_name} #{@user.last_name} updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit( :first_name,
                                    :last_name,
                                    :email,
                                    :password,
                                    :password_confirmation,
                                    :mobile,
                                    :admin,
                                    :skipper)
    end
end
