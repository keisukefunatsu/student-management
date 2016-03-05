class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def admin_user
    return if current_user.admin?
    redirect_to root_path, alert: '権限がありません'
  end

  def confirmed_user
    return if current_user.confirmed?
    redirect_to root_path, alert: 'このアカウントは承認待ちです、管理者の承認をお待ち下さい'
  end

end
