class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome"
      log_in @user
      redirect_to @user
    else
      flash.now[:danger] = 'user not found'
      render 'new'
    end    
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.events
    @previous_events = @user.previous_events
    @upcoming_events = @user_user.upcoming_events

  end

  def index
      @users = User.paginate(page: params[:page])
  end

  private

    def user_params
        params.require(:user).permit(:name, :email)
    end

end