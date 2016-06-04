class Timecard < ActiveRecord::Base
  COMING_TITLE = '登校時刻'.freeze
  OUT_TITLE = '下校時刻'.freeze

  belongs_to :user

  validates :title, inclusion: { in: [COMING_TITLE, OUT_TITLE] }

  def coming?
    title == COMING_TITLE
  end

  def out?
    title == OUT_TITLE
  end
end
