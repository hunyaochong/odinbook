class DropTableLikedPosts < ActiveRecord::Migration[7.2]
  def change
    drop_table :liked_posts
  end
end
