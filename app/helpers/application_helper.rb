module ApplicationHelper
  def active?(*controllers_name)
    "active" if controllers_name.include?(params[:controller])
  end

  def registered_tickets
    current_user.tickets.count if current_user.tickets
  end
end
