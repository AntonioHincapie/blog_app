class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :posts, :users, column: :AuthorId, primary_key: :users_id
    add_foreign_key :comments, :users, column: :AuthorId, primary_key: :users_id
    add_foreign_key :likes, :users, column: :AuthorId, primary_key: :users_id
    add_foreign_key :comments, :posts, column: :PostId, primary_key: :posts_id
    add_foreign_key :likes, :posts, column: :PostId, primary_key: :posts_id
  end
end
