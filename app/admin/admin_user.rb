ActiveAdmin.register AdminUser do     
  
  scope :admins, :default => true
  scope :super_admins

  actions :index, :edit, :update, :destroy, :new, :create

  #Delete filters
  config.clear_sidebar_sections!

  index do                            
    column :email                     
    column :role
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
      f.input :role, :as => :select, :collection => ["Admin", "SuperAdmin"], :include_blank => false
    end                               
    f.buttons                         
  end                       
end                                   
