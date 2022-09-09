class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'AuthorId'
  belongs_to :post

  after_save :update_counter

  private

  def update_counter
    PostId.increment!(:LikesCounter)
  end
end
