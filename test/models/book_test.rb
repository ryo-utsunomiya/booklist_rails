require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'rate must be larger than or equal to 0' do
    book = Book.new
    book.title = 'test'
    book.rate = -1
    assert book.invalid?
    assert_equal ['must be greater than or equal to 0'], book.errors[:rate]
  end
end
