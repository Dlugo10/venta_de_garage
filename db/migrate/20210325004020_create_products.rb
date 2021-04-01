class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :price
      t.string :title
      t.string :dimensions
      t.string :age

      t.timestamps
    end
  end
end
