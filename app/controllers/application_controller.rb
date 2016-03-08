class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  rescue_from Forbidden, with: :rescue403
  rescue_from IpAddressRejected, with: :rescue403

  private
  def admin_user
    return if current_user.admin?
    redirect_to root_path, alert: '権限がありません'
  end

  def confirmed_user
    return if current_user.confirmed?
    redirect_to root_path, alert: 'このアカウントは承認待ちです、管理者の承認をお待ち下さい'
  end
  
  def rescue403(e)
   @exception = e
   render 'errors/forbidden', status: 403
  end

end
