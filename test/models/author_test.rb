require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  def setup
    @author = Author.new(full_name: "William Shakespeare")
  end

  test "create author" do
    assert @author.valid?
  end

  test "full_name should be present" do
    @author.full_name = "     "
    assert_not @author.valid?
  end

  test "full_name should be unique" do
    duplicate_author = @author.dup
    @author.save
    assert_not duplicate_author.valid?
  end

end
