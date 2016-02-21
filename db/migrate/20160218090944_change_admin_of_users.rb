class ChangeAdminOfUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :admin, :boolean, null: false, default: false
  end

  def self.down
    change_column :users, :admin, :boolean, null: false, default: false
  end
end
