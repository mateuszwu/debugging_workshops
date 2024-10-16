class CreateBook < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.references :book_status, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
