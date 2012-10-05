class Photo < ActiveRecord::Base
  attr_accessible :title, :text, :code, :position, :page_id

  belongs_to :page

  has_attached_file :photo,
  :styles => { 
    :small => "200x300#",
    :home => "959x430#"
    }
    
end
