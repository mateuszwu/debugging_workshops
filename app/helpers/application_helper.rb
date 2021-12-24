module ApplicationHelper
  def book_status_id(book)
    book.book_status_id_before_type_cast || "NOT PROVIDED"
  end
end
