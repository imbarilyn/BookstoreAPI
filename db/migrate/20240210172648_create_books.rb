class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :ttitle
      t.string :author
      t.string :publisher
      t.datetime :year_of_publish
      t.string :genre
      t.text :synopsis

      t.timestamps
    end
  end
end
