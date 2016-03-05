class TimecardsController < ApplicationController
  before_action :authenticate_user!
  before_action :confirmed_user

  def come
    @user = current_user
    @user.timecards.create(title: '登校時間')
    if @user.save
      redirect_to root_path, notice: '今日も頑張っていきましょう'
    else
      redirect_to root_path, notice: '何かエラーが起こったようです...再度お試し下さい'
    end
  end

  def out
    @user = current_user
    @user.timecards.create(title: '下校時間')
    if @user.save
      redirect_to root_path, notice: 'お疲れ様でした！気をつけて帰ってくださいね！'
    else
      redirect_to root_path, notice: '何かエラーが起こったようです...再度お試し下さい'
    end
  end

  def show
    @timecards = current_user.timecards
  end

end
