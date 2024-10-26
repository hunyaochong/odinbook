class CreateJoinTableLikedPosts < ActiveRecord::Migration[7.2]
  def change
    create_join_table :users, :posts do |t|
      t.index :user_id
      t.index :post_id
    end
  end
end
