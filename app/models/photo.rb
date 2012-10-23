class Photo < ActiveRecord::Base
  #attr_accessible :title, :text, :code, :position, :page, :photo, :page_id, :photo_content_type
  attr_accessible :photo, :photo_content_type, :product_id, :product

  #belongs_to :page
  belongs_to :product

  has_attached_file :photo, :styles => { :small => "170x200#"}

  validates_attachment_content_type :photo, :content_type => [ 'image/jpeg', 'image/png', 'image/tiff' ]
  validates_attachment_size :photo, :less_than => 10.megabytes
  
end
