class TimecardsController < ApplicationController
  before_action :authenticate_user!
  before_action :confirmed_user

  PER = 5

  def come
    if current_user.recent_timecard.out? && current_user.timecards.build(timecard_params).save
      redirect_to root_path, notice: 'こんにちは！今日も張り切っていきましょう！'
    else
      redirect_to root_path, notice: '再度お試し下さい'
    end
=begin
    if request.remote_ip == "203.141.154.175" || request.remote_ip == "124.103.227.155"
      @user.timecards.create(timecard_params)
      if @user.save
        redirect_to root_path, notice: 'こんにちは！今日も張り切っていきましょう！'
      else
        redirect_to root_path, notice: '何かエラーが起こったようです...再度お試し下さい'
      end
    else
      raise IpAddressRejected
    end
=end
  end

  def out
    if current_user.recent_timecard.coming? && current_user.timecards.build(timecard_params).save
      redirect_to root_path, notice: 'お疲れ様でした！'
    else
      redirect_to root_path, notice: '再度お試し下さい'
    end
=begin
    if request.remote_ip == "203.141.154.175" || request.remote_ip == "124.103.227.155"
      @user.timecards.create(timecard_params)
      if @user.save
        redirect_to root_path, notice: 'お疲れ様でした！'
      else
        redirect_to root_path, notice: '何かエラーが起こったようです...再度お試し下さい'
      end
    else
      raise IpAddressRejected
    end
=end
  end

  def show
    @timecards = current_user.timecards.page(params[:page]).per(PER).all.order('created_at DESC')
  end

  private

  def timecard_params
    params.require(:timecard).permit(
      :title
      )
  end

end
