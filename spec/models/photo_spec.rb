require 'spec_helper'

describe Photo do
  before(:each) { @attr = { 
             :photo => File.open(File.join(Rails.root, '/spec/fixtures/files/arcoiris.jpeg')) } }

  describe "DB" do
    it "should create with valid params" do
      expect do
        Photo.create( @attr )
      end.to change( Photo, :count ).by( 1 )
    end
  end

end