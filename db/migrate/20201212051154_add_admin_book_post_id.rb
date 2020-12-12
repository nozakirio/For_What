class AddAdminBookPostId < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_books, :post_id, :integer
  end
end
