class TransformBooks
  def self.call(books)
    new(books).call
  end

  def initialize(books)
    @books = books
  end

  def call
    @books.map do |book|
      {
        book_id: book.id,
        book_name: book.name,
        book_rating: book.rating,
        book_votes: book.votes,
        book_category_id: book.category.id,
        book_category_name: book.category.name,
      }
    end
  end
end
