class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :rating
      t.string :notes

      t.timestamps null: false
    end
  end
end
