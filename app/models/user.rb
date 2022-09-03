class User < ApplicationRecord
  has_many :posts, foreign_key: 'AuthorId'
  has_many :likes, foreign_key: 'AuthorId'
  has_many :comments, foreign_key: 'AuthorId'

  validates :Name, presence: true
  validates :PostCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def most_recent
    posts.limit(3).order('created_at desc')
  end
end
