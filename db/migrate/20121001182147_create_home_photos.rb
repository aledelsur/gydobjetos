class CreateHomePhotos < ActiveRecord::Migration
  def change
    create_table :home_photos do |t|

      t.text :text
      t.integer :position

      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size

      t.timestamps
    end
  end
end
