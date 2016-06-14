class Information < ActiveRecord::Base
  belongs_to :user
  has_many :tickets, :dependent => :delete_all
  validates :title, length: { maximum: 50 }, presence: true
  validates :content, length: { maximum: 2000 }, presence: true
  validates :start_date, presence: true
  validates :expire_date, presence: true
  validate :validate_start_date
  validate :validate_expire_date

  paginates_per 10

  private
  def validate_start_date
    if start_date <= Time.now
      errors.add(:start_date ,'は現在時刻以降の値を設定してください')
    end
  end

  def validate_expire_date
    if expire_date >= start_date
      errors.add(:expire_date ,'は開催日時以前の値を設定してください')
    end
  end
end
