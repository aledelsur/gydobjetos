class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :text
      t.string :code
      t.integer :category_id

      t.timestamps
    end
  end
end
