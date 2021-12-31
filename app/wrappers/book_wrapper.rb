class BookWrapper
  include Singleton

  class << self
    delegate :all_books, to: :instance
  end

  def initialize
    @client = BookClient.new
  end

  def all_books
    @client.all_books.map { |book| Book.new(**book) }
  end
end
