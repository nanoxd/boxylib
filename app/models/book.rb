class Book < ActiveRecord::Base
  validates :isbn, length: { maximum: 13 }
  validates :isbn, uniqueness: true
end
