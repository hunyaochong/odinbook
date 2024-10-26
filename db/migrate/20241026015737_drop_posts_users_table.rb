class DropPostsUsersTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :posts_users
  end
end
