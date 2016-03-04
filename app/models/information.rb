class Information < ActiveRecord::Base
  belongs_to :user
  has_many :tickets
  validates :title, length: { maximum: 50 }, presence: true
  validates :content, length: { maximum: 2000 }, presence: true
  validates :start_date, presence: true
  validates :expire_date, presence: true
  validate :start_date_should_be_before_expire_date

  private

  def start_date_should_be_before_expire_date
    return unless start_date && expire_date
    if start_date >= expire_date || start_date <= Time.now
      errors.add(:start_date, 'は掲載期限より前、または現在より後の日時を設定してください')
    end
  end
end
