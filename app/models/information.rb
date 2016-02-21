class Information < ActiveRecord::Base
  validates :title, length: { maximum: 50 }, presence: true
  validates :content, length: { maximum: 2000 }, presence: true
end
