class AddAuthorToResults < ActiveRecord::Migration
  def change
      add_column :results, :author_id, :integer, default: 0, null: false
  end
end
