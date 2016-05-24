class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :title, null:false
      t.text :content, null:false
      t.integer :category_id
      t.datetime :start_date
      t.datetime :expire_date

      t.timestamps null: false
    end
  end
end
