class Page < ActiveRecord::Base
  attr_accessible :title, :text, :key, :contact_address, :latitude, :longitude, :tel, :email, :meta_title, :meta_description, :meta_keywords

  has_many :photos

end
