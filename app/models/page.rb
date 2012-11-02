class Page < ActiveRecord::Base
  attr_accessible :title, :text, :key, :contact_address, :latitude, :longitude, :tel, :email, :meta_title, :meta_description, :meta_keywords

  require 'will_paginate/array'

  has_many :home_photos
  has_many :categories, :dependent => :destroy

  def site_image
    "#{self.key}-site-image.png"
  end

  def get_products(params)
    unless params[:category_id]
      categories.collect{|c| c.products}.flatten.paginate(:per_page => 12, :page => params[:page])
    else
      category = Category.find(params[:category_id])
      category.products.flatten.paginate(:per_page => 12, :page => params[:page])
    end
  end
end
