class AddAttachmentEbookToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :ebook
    end
  end

  def self.down
    drop_attached_file :books, :ebook
  end
end
