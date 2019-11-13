class Author < ApplicationRecord
	validates :full_name, presence: true, length: { maximum: 40 }, uniqueness: true

	has_many :author_books
	has_many :books, through: :author_books
end
