class GroupBooks
  def self.call(books)
    new(books).call
  end

  def initialize(books)
    @books = books
  end

  def call
    recommended_books = (external_recommendation_system_results & @books.map { |book| book[:book_name] })

    @books.select { |book| book[:book_name].in?(recommended_books) }.group_by { |book| book[:book_category_name] }
  end

  private

  def external_recommendation_system_results
    BookWrapper.recommended_books
  end
end
