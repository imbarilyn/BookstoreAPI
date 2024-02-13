class AddPublisherIdToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :publisher_id, :integer
  end
end
