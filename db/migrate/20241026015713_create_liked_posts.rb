class CreateLikedPosts < ActiveRecord::Migration[7.2]
  def change
    create_table :liked_posts, id: false do |t|
      t.bigint :liked_post_id
      t.bigint :liked_user_id
      t.timestamps
    end

    add_index :liked_posts, :liked_post_id
    add_index :liked_posts, :liked_user_id
  end
end
