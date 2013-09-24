class AddFieldsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :direct_upload_url, :string
    add_column :books, :processed, :boolean, default: false, null: false
    add_index :books, :processed
  end
end
