class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 1, maximum: 140 }
  validates :content, presence: true, length: { minimum: 1 }
end
