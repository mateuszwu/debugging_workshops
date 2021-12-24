class Book < ApplicationRecord
  belongs_to :book_status
  belongs_to :category

  validates :name, presence: true
  validates :book_status_id, presence: true
  validates :category_id, presence: true
end
