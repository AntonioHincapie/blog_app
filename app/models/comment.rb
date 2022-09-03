class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_counter

  private

  def update_counter
    user.increment!(:PostCounter)
  end
end
