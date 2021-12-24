class OrderBooksCalculator
  def self.call(books)
    new(books).call
  end

  def initialize(books)
    @books = books
  end

  def call
    @books.each do |category, books|
      @books[category] = books.sort_by { |book| book[:normalized_weighted_rating] }.reverse!.first(10)
    end
  end
end
