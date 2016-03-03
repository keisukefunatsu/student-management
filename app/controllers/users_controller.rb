class UsersController < ApplicationController
before_action :authenticate_user!
before_action :confirmed_user
before_action :admin_user, except: [:show]
  def show
      @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_index_path, notice: '生徒情報を更新しました'
    else
      redirect_to user_path , notice: 'ログインしてください'
    end
  end

  def destroy

  end
  private

  def user_params
    params.require(:user).permit(
      :grade, :school_name, :phone_number, :confirmed
    )
  end
end
