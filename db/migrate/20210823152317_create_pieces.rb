class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.string :name
      t.integer :height
      t.integer :length
      t.integer :price
      t.text :description
      t.string :category
      t.string :artist
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
