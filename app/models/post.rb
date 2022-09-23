class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'
  has_many :comments

  validates :title, presence: true
  validates :title, length: { maximum: 250 }

  after_save :update_post_counter

  def most_recent_comments
    comments.includes([:author]).order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.update(post_counter: author.posts.count)
  end
end
