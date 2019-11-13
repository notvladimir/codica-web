require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @book = Book.new(title: "Sonet 116")
  end

  test "create book" do
    assert @book.valid?
  end

  test "title should be present" do
    @book.title = "     "
    assert_not @book.valid?
  end

  test "title should be unique" do
    duplicate_book = @book.dup
    @book.save
    assert_not duplicate_book.valid?
  end

  test "create author to book" do
    AUTHOR_FULL_NAME = "William Shakespeare"
    @book.create_author AUTHOR_FULL_NAME
    assert @book.save
    assert_equal AUTHOR_FULL_NAME, @book.authors.first.full_name
  end

  test "create group for book" do
    GROUP_NAME = "Poetry"
    @book.create_group GROUP_NAME
    assert @book.save
    group = @book.group
    assert_equal GROUP_NAME, group.name
  end
end
