class SiteSection < ActiveRecord::Base
  attr_accessible :text, :section_type
  
  has_many :photos
end
