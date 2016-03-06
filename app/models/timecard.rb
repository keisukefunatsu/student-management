class Timecard < ActiveRecord::Base
  belongs_to :user
  validate :clock_time_should_be_unique_in_a_day

  private

  def clock_time_should_be_unique_in_a_day
    return unless title == '登校時間' || title == '下校時間'
  end
end
