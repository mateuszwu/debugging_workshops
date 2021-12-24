class CreateBookStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :book_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
