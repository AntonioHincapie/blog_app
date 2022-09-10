class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  validates :Name, presence: true
  validates :PostCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def most_recent
    posts.limit(3).order('created_at desc')
  end
end
