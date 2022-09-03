class FixTablesTwo < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :CreatedAt
    remove_column :likes, :CreatedAt
    remove_column :posts, :CreatedAt
    remove_column :users, :CreatedAt
  end
end
