class RenameIsbnColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :ISBN, :isbn
  end
end
