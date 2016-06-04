class AddAuthorToResults < ActiveRecord::Migration
  def change
      add_column :results, :author_id, :integer
      add_index :results, :author_id
  end
end
