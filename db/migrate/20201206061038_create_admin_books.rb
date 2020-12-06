class CreateAdminBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_books do |t|
      t.integer :user_id, null: false
      t.integer :book_id, null: false
      t.boolean :want_read, null: false, default: "FALSE"
      t.boolean :have_read, null: false, default: "FALSE"
      t.timestamps
    end
  end
end
