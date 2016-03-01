class InformationController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, except: [:show]
  def new
    @info = Information.new
  end

  def create
    @info = Information.create(info_params)
    if @info.save
      redirect_to root_path, notice: 'お知らせを作成しました。'
    else
      render :new
    end
  end

  def edit
    @info = Information.find(params[:id])
  end

  def update
    @info = Information.find(params[:id])
    if @info.update(info_params)
      redirect_to root_path, notice: 'お知らせを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @info = Information.find(params[:id])
    @info.destroy!
      redirect_to root_path
  end

  def show
    @info = Information.find(params[:id])
  end
  private

  def info_params
    params.require(:information).permit(
      :title, :content, :category_id, :expire_date, :participate
      )
  end
end
