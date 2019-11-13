class AuthorBook < ApplicationRecord
  validates :author, uniqueness: { scope: :book }

  belongs_to :book
  belongs_to :author
end
