class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  before_action :correct_user
  
  def show
    @user = User.find(params[:id])
    @weight_latest = weight_latest
    @date_latest = date_latest
    @fluc = fluctuation
    @date_start = date_start
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :weight_initial, :weight_goal, :age, :height)
  end
  
  
  
  
  
  def weight_latest
    if @user.weights.any?
       log_latest.weight
    else
       @user.weight_initial
    end
  end
  
  def weight_second_latest
    if @user.weights.order(created_at: :desc).limit(1).offset(1).any?
      @user.weights.order(created_at: :desc).limit(1).offset(1).first.weight
    else
      @user.weight_initial
    end
  end
  
  def date_latest
    if @user.weights.any?
      log_latest.created_at.strftime('%Y/%m/%d')
    else
      date_start
    end
  end
  
  def fluctuation
    if weight_latest - weight_second_latest >= 0
      return '+' + (weight_latest - weight_second_latest).round(2).to_s
    else
      (weight_latest - weight_second_latest).round(2)
    end
  end
    
  
  def log_latest
    @user.weights.order(created_at: :desc).first
  end
  
  def date_start
    @user.created_at.strftime('%Y/%m/%d')
  end
end
