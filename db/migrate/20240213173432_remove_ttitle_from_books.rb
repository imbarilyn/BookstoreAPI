class RemoveTtitleFromBooks < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :ttitle, :string
  end
end
