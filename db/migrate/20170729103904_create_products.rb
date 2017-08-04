class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.integer :price

      t.timestamps
    end
    add_index :products, :slug, :unique => true
  end
end
