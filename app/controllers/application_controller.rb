class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def admin_user
    return if current_user.admin?
    redirect_to root_path, alert: '閲覧権限がありません'
  end

  def confirmed_user
    return if current_user.confirmed?
    redirect_to root_path, alert: 'このアカウントは承認待ちです'
  end

end
