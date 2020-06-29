class WeightsController < ApplicationController
  def new
    @user = current_user
    @weight = Weight.new
  end

  def create
    @user = current_user
    @weight = current_user.weights.build(weight_params)
    if @weight.save
      flash[:success] = '体重を更新しました'
      redirect_to @user
    else
      flash.now[:danger] = '更新に失敗しました'
      render :new
    end
  end
  
  
  
  private
  
  def weight_params
    params.require(:weight).permit(:weight)
  end
end
