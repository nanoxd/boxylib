class Book < ActiveRecord::Base
  belongs_to :user
  validates :isbn, length: { maximum: 13 }, presence: true
  validates :isbn, uniqueness: true
end
