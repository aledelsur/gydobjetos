class HomePhoto < ActiveRecord::Base
  attr_accessible :photo, :text, :photo_content_type

  has_attached_file :photo, 
  :styles => { :small => "170x200#", :home =>"784x260#"},
    :storage => :s3,
    :bucket => "gydobjetos",
    :s3_options     => {
    :server => "s3-website-us-east-1.amazonaws.com"},
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "/#{Rails.env}/home_photos/:attachment/:style/:id/:filename"
  

  validates_attachment_content_type :photo, :content_type => [ 'image/jpeg', 'image/png', 'image/tiff' ]
  validates_attachment_size :photo, :less_than => 10.megabytes
  
end
