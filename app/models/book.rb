class Book < ActiveRecord::Base
  belongs_to :user
  validates :isbn, length: { minimum: 0, maximum: 13 }
  validates :user_id, presence: true
  has_attached_file :cover, styles: { thumb: "170x220", medium: "380x500" }
  has_attached_file :ebook,
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    path: proc { "#{self.last.author}/#{self.last.title}/:filename" }
  validates_attachment :ebook, content_type: { content_type: ["application/epub+zip", "application/pdf"] }
end
