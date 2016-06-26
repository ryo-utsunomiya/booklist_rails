class Book < ApplicationRecord
  validates :rate, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
