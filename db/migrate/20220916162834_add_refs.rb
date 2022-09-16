class AddRefs < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :author, null: false, foreign_key: { to_table: :users }, index: true
    add_reference :comments, :author, null: false, foreign_key: {to_table: :users}, index: true
    add_reference :comments, :post, null: false, foreign_key: true, index: true
    add_reference :likes, :author, null: false, foreign_key: {to_table: :users}, index:true
    add_reference :likes, :post, null: false, foreign_key: true, index:true
  end
end
