page = Page.first
unless page
  Page.create(:id => 1, :title=>"Quienes somos", :key => "quienes-somos")
  Page.create(:id => 2, :title=>"Contacto", :key => "contacto")
  Page.create(:id => 3, :title=>"Hogar", :key => "hogar")
  Page.create(:id => 4, :title=>"Bazar", :key => "bazar")
  Page.create(:id => 5, :title=>"Petit", :key => "petit")
  puts "All pages created"
end
