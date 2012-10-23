admin_user = AdminUser.first
unless admin_user
  AdminUser.create(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :role => 'SuperAdmin')
  puts "SuperAdmin user created"
end

page = Page.first
unless page
  Page.create(:title=>"Quienes somos", :key => "quienes-somos")
  Page.create(:title=>"Contacto", :key => "contacto")
  Page.create(:title=>"Hogar", :key => "hogar")
  Page.create(:title=>"Bazar", :key => "bazar")
  Page.create(:title=>"Petit", :key => "petit")
  puts "All pages created"
end


#JUST FOR TESTING PAGINATION WE WILL CREATE FALSE REGISTERS IN PHOTOS TABLE
#THEN WE WILL DELETE THIS Seed
# pag = Photo.first
# unless pag
#   Photo.create(:product_id=>2)
#   Photo.create(:product_id=>2)
#   Photo.create(:product_id=>2)
#   Photo.create(:product_id=>2)
#   Photo.create(:product_id=>2)
#   Photo.create(:product_id=>2)
#   Photo.create(:product_id=>2)
#   Photo.create(:product_id=>2)
#   Photo.create(:product_id=>2)
#   Photo.create(:product_id=>2)
#   puts "REGISTERS IN photos TABLE WERE CREATED. THEN DELETE THIS REGISTERS"
# end