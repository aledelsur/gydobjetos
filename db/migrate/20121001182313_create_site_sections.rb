class CreateSiteSections < ActiveRecord::Migration
  def change
    create_table :site_sections do |t|

      t.text :text
      t.string :section_type

      t.timestamps
    end
  end
end
