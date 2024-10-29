class RemoveFollowerFromConnections < ActiveRecord::Migration[7.2]
  def change
    remove_reference :connections, :follower, null: false, foreign_key: { to_table: :users }
  end
end
