# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

book_statues = [
  BookStatus.create(name: 'Research'),
  BookStatus.create(name: 'In Progress'),
  BookStatus.create(name: 'Draft'),
  BookStatus.create(name: 'Revise and edit'),
  BookStatus.create(name: 'Published'),
  BookStatus.create(name: 'Canceled'),
]

categories = [
  Category.create(name: 'Action and Adventure'),
  Category.create(name: 'Classics'),
  Category.create(name: 'Comic Book or Graphic Novel'),
  Category.create(name: 'Detective and Mystery'),
  Category.create(name: 'Fantasy'),
  Category.create(name: 'Historical Fiction\n'),
  Category.create(name: 'Horror'),
  Category.create(name: 'Literary Fiction'),
  Category.create(name: 'Romance'),
  Category.create(name: 'Science Fiction (Sci-Fi)'),
  Category.create(name: 'Short Stories'),
  Category.create(name: 'Suspense and Thrillers'),
  Category.create(name: "Women's Fiction"),
  Category.create(name: 'Biographies and Autobiographies'),
  Category.create(name: 'Cookbooks'),
  Category.create(name: 'Essays'),
  Category.create(name: 'History'),
  Category.create(name: 'Memoir'),
  Category.create(name: 'Poetry'),
  Category.create(name: 'Self-Help'),
  Category.create(name: 'True Crime'),
]

4_000.times do
  Book.create(
    name: Faker::Book.title,
    category: categories.sample,
    book_status: book_statues.sample,
    votes: rand(10_000),
    rating: rand(500) / 100.0,
  )
end
