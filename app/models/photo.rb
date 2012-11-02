class Photo < ActiveRecord::Base
  #attr_accessible :title, :text, :code, :position, :page, :photo, :page_id, :photo_content_type
  attr_accessible :photo, :photo_content_type, :product_id, :product

  belongs_to :product

  has_attached_file :photo,
   :styles => { :small => "170x200#", :modal => "600x400#", :modal_footer => "85x80#"}, 
    :storage => :s3,
    :bucket => "gydobjetos",
    :s3_options     => {
    :server => "s3-website-us-east-1.amazonaws.com"},
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "/#{Rails.env}/photos/:attachment/:style/:id/:filename"

  validates_attachment_content_type :photo, :content_type => [ 'image/jpeg', 'image/png', 'image/tiff' ]
  validates_attachment_size :photo, :less_than => 10.megabytes
  
end
