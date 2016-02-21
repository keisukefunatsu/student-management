class UsersController < ApplicationController
before_action :authenticate_user!
before_action :admin_user, except: [:show]

  PER = 5
  def index
    @user = User.page(params[:page]).per(PER).all
  end

  def show
    if current_user.admin?
      @user = User.find(params[:id])
      @result = @user.results
    else
      @user = current_user
    end
  end

  def edit
    if current_user.admin?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def update
    if current_user.admin?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end



end
