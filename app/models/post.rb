class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, foreign_key: 'posts_id'
  has_many :likes, foreign_key: 'posts_id'

  def most_recent_comments
    comments.limit(5).order('created_at desc')
  end

  after_save :update_counter

  private

  def update_counter
    user.increment!(:PostCounter)
  end
end
