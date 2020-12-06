class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :book_id, null: false
      t.string :reason, null: false
      t.integer :stars
      t.text :comment
      t.timestamps
    end
  end
end
