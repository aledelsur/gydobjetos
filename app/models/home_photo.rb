class HomePhoto < ActiveRecord::Base
  attr_accessible :photo, :text, :photo_content_type

  has_attached_file :photo, :styles => { :small => "170x200#", :home =>"170x200#"}

  validates_attachment_content_type :photo, :content_type => [ 'image/jpeg', 'image/png', 'image/tiff' ]
  validates_attachment_size :photo, :less_than => 10.megabytes
  
end
