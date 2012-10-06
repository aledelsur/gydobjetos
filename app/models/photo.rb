class Photo < ActiveRecord::Base
  attr_accessible :title, :text, :code, :position, :page, :photo, :page_id, :photo_content_type

  belongs_to :page

  has_attached_file :photo, :styles => { :small => "170x200#"}

  validates_attachment_content_type :photo, :content_type => [ 'image/jpeg', 'image/png', 'image/tiff' ]
  validates_attachment_size :photo, :less_than => 10.megabytes
  
  before_create :reload_size

  def reload_size
    self.reprocess!
  end
end
