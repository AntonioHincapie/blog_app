class Post < ApplicationRecord
  belongs_to :AuthorId, class_name: 'User'
  has_many :comments, foreign_key: 'PostId'
  has_many :likes, foreign_key: 'PostId'

  validates :Title, presence: true, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def most_recent_comments
    comments.limit(5).order('created_at desc')
  end

  after_save :update_counter

  private

  def update_counter
    AuthorId.increment!(:PostCounter)
  end
end
