ActiveAdmin.register Page do
  
  actions :index, :edit, :update

  index do 
    column :title
    default_actions
  end

  form do |f|
    f.inputs do
      if f.object.key == "contacto"
        f.input :text, :label => "Texto de la pagina", :as => :rich, :config => { :width => '75%', :height => '200px' }
        f.input :tel, :label => "Telefonos"
        f.input :contact_address, :label => "Direccion de contacto"
        f.input :email, :label => "Email"
      else
        f.input :text, :label => "Texto de la pagina", :as => :rich, :config => { :width => '75%', :height => '200px' }
      end
    end
    f.buttons
  end

end
