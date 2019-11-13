require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @group = Group.new(name: "Poetry")
  end

  test "create group" do
    assert @group.valid?
  end

  test "name should be present" do
    @group.name = "     "
    assert_not @group.valid?
  end

  test "group should be unique" do
    duplicate_group = @group.dup
    @group.save
    assert_not duplicate_group.valid?
  end

  test "add book to group" do
  	BOOK_TITLE = "Sonet 116"
    book = Book.create title: BOOK_TITLE
    @group.add_book book
 	  assert @group.save
 	  assert_equal BOOK_TITLE, @group.books.first.title
  end
end
