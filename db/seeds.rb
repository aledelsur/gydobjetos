page = Page.first
unless page
  Page.create(:title=>"Quienes somos", :key => "quienes-somos")
  Page.create(:title=>"Contacto", :key => "contacto")
  Page.create(:title=>"Hogar", :key => "hogar")
  Page.create(:title=>"Bazar", :key => "bazar")
  Page.create(:title=>"Petit", :key => "petit")
  Page.create(:title=>"Home", :key => "home")
  puts "All pages created"
end


#JUST FOR TESTING PAGINATION WE WILL CREATE FALSE REGISTERS IN PHOTOS TABLE
#THEN WE WILL DELETE THIS Seed
pag = Photo.first
unless pag
  Photo.create(:page_id=>2)
  Photo.create(:page_id=>2)
  Photo.create(:page_id=>2)
  Photo.create(:page_id=>2)
  Photo.create(:page_id=>2)
  Photo.create(:page_id=>2)
  Photo.create(:page_id=>2)
  Photo.create(:page_id=>2)
  Photo.create(:page_id=>2)
  Photo.create(:page_id=>2)
  puts "REGISTERS IN photos TABLE WERE CREATED. THEN DELETE THIS REGISTERS"
end