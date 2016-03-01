class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true, foreign_key: true, unique: true
      t.references :information, index: true, foreign_key: true, unique: true, null: false
      t.string :comment
      t.string :comment2
    
      t.timestamps null: false
    end
    add_index :tickets,[:user_id, :information_id], unique: true
    add_index :tickets,[:information_id, :user_id], unique: true

  end
end
