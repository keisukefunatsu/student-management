class AddColumsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :grade, :string
    add_column :users, :school_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :confirmed, :boolean
  end
end
