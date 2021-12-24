class RecommendationsService
  def self.call
    new.call
  end

  def call
    books = get_all_books
    books_with_category = transform_books(books)
    books_with_category_and_weighted_rating = calculate_weighted_rating(books_with_category)
    books = group_books_by_category(books_with_category_and_weighted_rating)
    order_books(books)
  end

  private

  def get_all_books
    query = %{
      SELECT id, name, category_id, book_status_id, created_at, updated_at, rating, votes
      FROM (
        SELECT books.*, ROW_NUMBER() OVER(PARTITION BY books.name) AS row_number from books
      ) AS b
      WHERE b.row_number = 1
    }
    books = ActiveRecord::Base.connection.exec_query(query)
    books.rows.map do |book_row|
      Book.new(
        books.columns.each_with_index.inject({}) do |attributes, (column_name, index)|
          attributes[column_name] = book_row[index]
          attributes
        end
      )
    end
  end

  def transform_books(books)
    TransformBooks.call(books)
  end

  def calculate_weighted_rating(books)
    WeightedRatingCalculator.call(books)
  end

  def order_books(books)
    OrderBooksCalculator.call(books)
  end

  def group_books_by_category(books)
    GroupBooks.call(books)
  end
end
