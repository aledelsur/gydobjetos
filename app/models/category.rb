class Category < ActiveRecord::Base
  attr_accessible :name, :page_id, :page

  belongs_to :page
  has_many :products, :dependent => :destroy
end
