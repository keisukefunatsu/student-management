class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :information
  validates :comment,length: { maximum: 30}, allow_blank: true
  validates :comment2,length: { maximum: 30}, allow_blank: true
end
