class AddDetailsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :book_image_large_id, :string
    add_column :books, :item_url, :string
  end
end
