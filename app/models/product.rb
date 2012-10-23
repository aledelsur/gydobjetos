class Product < ActiveRecord::Base
  attr_accessible :title, :text, :code, :category_id

  belongs_to :category
  has_many :photos, :dependent => :destroy
end
