class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'AuthorId'
  has_many :comments
  has_many :likes

  validates :Title, presence: true, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def most_recent_comments
    comments.limit(5).order('created_at desc')
  end

  after_save :update_counter

  private

  def update_counter
    author.update(PostCounter: author.posts.count)
  end
end
