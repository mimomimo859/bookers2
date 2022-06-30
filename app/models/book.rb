class Book < ApplicationRecord
  has_one_attached :book_images
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
end
