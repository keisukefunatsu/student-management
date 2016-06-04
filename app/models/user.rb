class User < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :results, :dependent => :delete_all
  has_many :report_results, :class_name => Result, :foreign_key => :author_id
  has_many :tickets, :dependent => :delete_all
  has_many :timecards, :dependent => :delete_all
  has_many :information
  has_many :participating_events, through: :tickets, source: :information
  belongs_to_active_hash :grade, foreign_key: :grade_code, primary_key: :code

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_google_oauth2(auth)
    user = User.where(email: auth.info.email).first

    unless user
      user = User.create(name:     auth.info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0, 20])
    end
    user
  end

  def increase_grade
    return nil unless grade
    update(grade_code: grade.next_grade_code)
  end

  def increase_grade!
    raise '学年が設定されていません' unless grade
    update!(grade_code: grade.next_grade_code)
  end

  def recent_timecard
    timecards.order(created_at: :desc).first
  end
end
