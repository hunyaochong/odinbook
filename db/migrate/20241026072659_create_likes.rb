class CreateLikes < ActiveRecord::Migration[7.2]
  def change
    create_table :likes, id: false do |t|
      t.bigint :user_id, null: false
      t.bigint :post_id, null: false
      t.index [ :user_id, :post_id ], unique: true
      t.timestamps
    end
  end
end
