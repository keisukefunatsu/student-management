class AddParticipateToInformation < ActiveRecord::Migration
  def change
    add_column :information, :participate, :boolean
    add_reference :information, :user, :default => 1, index: true
  end
end
