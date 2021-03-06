class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :series
      t.integer :isbn
      t.string :genre
      t.text :description

      t.timestamps
    end
  end
end
