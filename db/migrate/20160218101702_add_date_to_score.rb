class AddDateToScore < ActiveRecord::Migration
  def change
    add_column :scores, :date, :string
  end
end
