class ChangeGradeToGradeCode < ActiveRecord::Migration
  def change
    remove_column :users, :grade, :string
    add_column :users, :grade_code, :string
    add_index :users, :grade_code
  end
end
