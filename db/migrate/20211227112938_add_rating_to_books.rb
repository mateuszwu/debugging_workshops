class AddRatingToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :rating, :decimal
  end
end
