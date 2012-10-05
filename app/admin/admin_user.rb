ActiveAdmin.register AdminUser do     
  
  scope :managers, :default => true
  scope :admins

  #Delete filters
  config.clear_sidebar_sections!

  controller do
    def create
      params[:admin_user][:role] = "manager"
      AdminUser.create(params[:admin_user])
      redirect_to admin_admin_users_path
    end
  end

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
    end                               
    f.buttons                         
  end                           
end                                   
