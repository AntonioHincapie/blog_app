class User < ApplicationRecord
  has_many :posts, foreign_key: 'AuthorId'
  has_many :likes, foreign_key: 'AuthorId'
  has_many :comments, foreign_key: 'AuthorId'

  def most_recent
    posts.limit(3).order('created_at desc')
  end
end
