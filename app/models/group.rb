class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }, uniqueness: true
  has_many :books, dependent: :delete_all

  def add_book(book)
    books << book
  end
end
