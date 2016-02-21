class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def admin_user
    return if current_user.admin?
    redirect_to root_path, alert: '閲覧権限がありません'
  end

end
