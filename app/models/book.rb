class Book < ActiveRecord::Base
  belongs_to :user
  validates :isbn, length: { minimum: 0, maximum: 13 }
  validates :user_id, presence: true
end
