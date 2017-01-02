class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 } #posts are capped at 200 chars.
  default_scope -> { order(created_at: :desc) } # newest posts first.
end
