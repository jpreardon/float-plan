class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:index, :create, :edit, :update, :destroy]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.paginate(page: params[:page]).order('last_name')
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
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
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
