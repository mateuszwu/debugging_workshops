class AddVotesToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :votes, :integer
  end
end
