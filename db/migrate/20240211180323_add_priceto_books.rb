class AddPricetoBooks < ActiveRecord::Migration[7.1]
  def change
    add_column  :Books, :price , :integer
  end
end
