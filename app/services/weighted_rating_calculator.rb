require 'matrix'

class WeightedRatingCalculator
  def self.call(books)
    new(books).call
  end

  def initialize(books)
    @books = books
  end

  def call
    @books.each_with_index { |book, index| calculate_weighted_rating(book, index) }
    normalize_weighted_rating(@books)
    @books
  end

  private

  def calculate_weighted_rating(book, index)
    @books[index][:weighted_rating] = (1.2 * book[:book_rating] + 1.5 * book[:book_votes])
  end

  def normalize_weighted_rating(books)
    normalize_weighted_ratings = Vector.elements(books.map { |book| book[:book_votes] }).normalize
    @books.each_with_index do |book, index|
      book[:normalized_weighted_rating] = normalize_weighted_ratings[index] * book[:book_rating]
    end
  end
end
