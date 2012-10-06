class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|

      t.string :title
      t.text :text
      t.string :code
      t.integer :page_id
      t.attachment :photo
      t.integer :position

      t.timestamps
    end
  end
end
