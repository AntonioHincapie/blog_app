class FixTables < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :UpdatedAt, :CreatedAt
    remove_column :likes, :UpdatedAt, :CreatedAt
    remove_column :posts, :UpdatedAt, :CreatedAt
    remove_column :users, :UpdatedAt, :CreatedAt
  end
end
