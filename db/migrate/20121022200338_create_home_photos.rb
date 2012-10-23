class CreateHomePhotos < ActiveRecord::Migration
  def change
    create_table :home_photos do |t|
      t.attachment :photo
      t.text :text

      t.timestamps
    end
  end
end
