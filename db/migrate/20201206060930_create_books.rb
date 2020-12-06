class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :ISBN, null: false
      t.date :publication_date, null: false
      t.string :book_image_id, null: false
      t.timestamps
    end
  end
end
