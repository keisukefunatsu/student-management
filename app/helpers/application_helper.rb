module ApplicationHelper
  def active?(*controllers_name)
    "active" if controllers_name.include?(params[:controller])
  end

  def registered_tickets
  from = Time.now.at_beginning_of_day
  to   = from + 1.day
    current_user.tickets.count if current_user.tickets
  end
end
