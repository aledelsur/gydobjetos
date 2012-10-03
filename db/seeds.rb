page = Page.first
unless page
  Page.create(:id => 1, :title=>"Quienes somos", :key => "quienes-somos")
  Page.create(:id => 2, :title=>"Contacto", :key => "contacto")
  Page.create(:id => 3, :title=>"Hogar", :key => "hogar")
  Page.create(:id => 4, :title=>"Bazar", :key => "bazar")
  Page.create(:id => 5, :title=>"Petit", :key => "petit")
  puts "All pages created"
end


#JUST FOR TESTING PAGINATION WE WILL CREATE FALSE REGISTERS IN PHOTOS TABLE
#THEN WE WILL DELETE THIS Seed
pag = Photo.first
unless pag
  Photo.create(:id=>1)
  Photo.create(:id=>2)
  Photo.create(:id=>3)
  Photo.create(:id=>4)
  Photo.create(:id=>5)
  Photo.create(:id=>6)
  Photo.create(:id=>7)
  Photo.create(:id=>8)
  Photo.create(:id=>9)
  Photo.create(:id=>10)
  Photo.create(:id=>11)
  Photo.create(:id=>12)
  Photo.create(:id=>13)
  Photo.create(:id=>14)
  Photo.create(:id=>15)
  Photo.create(:id=>16)
  Photo.create(:id=>17)
  Photo.create(:id=>18)
  Photo.create(:id=>19)
  Photo.create(:id=>20)
  Photo.create(:id=>21)
  Photo.create(:id=>22)
  Photo.create(:id=>23)
  Photo.create(:id=>24)
  Photo.create(:id=>25)
  puts "REGISTERS IN photos TABLE WERE CREATED. THEN DELETE THIS REGISTERS"
end