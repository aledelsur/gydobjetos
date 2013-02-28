class Product < ActiveRecord::Base
  attr_accessible :title, :text, :code, :category_id

  def initialize title, text, code, category_id
    @title = title
    @text = text
    @code = code
    @category_id = category_id
  end

  belongs_to :category
  has_many :photos, :dependent => :destroy

  def has_a_category?
    !@category_id.nil?
  end
end
