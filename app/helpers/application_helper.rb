module ApplicationHelper
  def active?(*controllers_name)
    "active" if controllers_name.include?(params[:controller])
  end
  def registered_tickets
    now = Time.zone.now
    current_user.participating_events.where(':now < start_date', now: now).count if current_user.participating_events
  end
end
