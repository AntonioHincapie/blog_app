class Like < ApplicationRecord
  belongs_to :AuthorId, class_name: 'User'
  belongs_to :PostId, class_name: 'Post'

  after_save :update_counter

  private

  def update_counter
    PostId.increment!(:LikesCounter)
  end
end
