class Book < ActiveRecord::Base
  validates :isbn, length: { maximum: 13 }, presence: true
  validates :isbn, uniqueness: true
end
