class RemoveBookIdFromAuthors < ActiveRecord::Migration[7.1]
  def change
    remove_column :authors, :book_id
  end
end
