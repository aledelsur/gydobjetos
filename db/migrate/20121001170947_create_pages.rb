class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :text
      t.string :key
      t.string :contact_address
      t.float :latitude
      t.float :longitude
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords

      t.timestamps
    end
  end
end
