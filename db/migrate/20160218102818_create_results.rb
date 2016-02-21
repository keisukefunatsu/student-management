class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :user
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
