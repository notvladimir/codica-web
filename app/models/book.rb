class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 40 }, uniqueness: true
  
  belongs_to :group, optional: true
  has_many :author_books, dependent: :delete_all
  has_many :authors, through: :author_books

  has_one_attached :image

  def create_author(full_name)
  	self.authors << Author.create(full_name: full_name)
  end

  def add__author(author)
    self.authors << author
  end

  def create_group(name)
  	newGr = Group.create(name: name)
  	self.group = newGr
  end
end

