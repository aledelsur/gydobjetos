class Photo < ActiveRecord::Base
  attr_accessible :title, :text, :code, :position

  belongs_to :site_section

  has_attached_file :photo,
  :styles => { 
    :small => "200x300#",
    }
    
end
