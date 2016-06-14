class Result < ActiveRecord::Base
  belongs_to :user
  belongs_to :author, class_name: User
  validates :title, length: { maximum: 50 }, presence: true
  validates :content, length: { maximum: 2000 }, presence: true
  validates :author_id, presence: true


  paginates_per 10

end
