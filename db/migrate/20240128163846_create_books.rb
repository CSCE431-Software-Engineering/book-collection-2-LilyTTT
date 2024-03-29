class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.decimal :price
      t.date :published_date
      t.string :publisher
      t.integer :pages
      t.date :release_date

      t.timestamps
    end
  end
end
