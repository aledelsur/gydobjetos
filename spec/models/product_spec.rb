#http://blog.teamtreehouse.com/an-introduction-to-rspec
# [TESTING STATIC PAGES GOOODDDD !!!] http://ruby.railstutorial.org/chapters/static-pages#top 
require 'spec_helper'

describe Product do


  before :each do
    @product = Product.new :title, :text, :code, :category_id
  end

  describe "#new" do
    it "returns a new Product object" do
      @product.should be_an_instance_of Product
    end
  end

  it "should have a category" do
    @product.should have_a_category
  end

end