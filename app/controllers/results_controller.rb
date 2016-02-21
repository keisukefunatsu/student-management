class ResultsController < ApplicationController
before_action :authenticate_user!
before_action :admin_user, except: [:show]
  PER = 4
  def new
    @user = User.find(params[:format])
    @result = @user.results.new
  end

  def create
    @user = User.find(params[:user_id])
    @result = @user.results.create(result_params)
    if @result.save
      redirect_to result_path(@user), notice: '指導報告を作成しました。'
    else
      render :new
    end
  end

  def show
    if current_user.admin?
      @user = User.find(params[:id])
      @result = @user.results.page(params[:page]).per(PER).order('created_at DESC')
    else
      @user = current_user
      @result = @user.results.page(params[:page]).per(PER).order('created_at DESC')
    end
  end

  def edit
    @result = Result.find(params[:id])
  end

  def update
    @result = Result.find(params[:id])
    @result.update(result_params)
    if @result.save
      redirect_to result_path(@result.user), notice: '指導報告を修正しました。'
    else
      render :edit
    end
  end

  def destroy
    @result = Result.find(params[:id])
    @result.destroy!
    redirect_to result_path(@result.user)
  end



  private

  def result_params
    params.require(:result).permit(
      :title, :content
      )
  end
end
