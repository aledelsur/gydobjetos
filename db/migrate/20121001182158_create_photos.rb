class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|

      t.string :title
      t.text :text
      t.string :code
      
      t.integer :site_section_id
      t.integer :position

      t.timestamps
    end
  end
end
