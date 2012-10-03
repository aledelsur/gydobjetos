class Photo < ActiveRecord::Base
  attr_accessible :title, :text, :code, :position

  belongs_to :page

  has_attached_file :photo,
  :styles => { 
    :small => "200x300#",
    }
    
end
