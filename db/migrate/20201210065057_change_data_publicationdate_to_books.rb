class ChangeDataPublicationdateToBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :publication_date, :string
  end
end
