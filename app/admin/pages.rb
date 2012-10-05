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
      elsif f.object.key == "quienes-somos"
        f.input :text, :label => "Texto de la pagina", :as => :rich, :config => { :width => '75%', :height => '200px' }
      else
        f.input :text, :label => "Texto de la pagina", :as => :rich, :config => { :width => '75%', :height => '200px' }
        #f.object.photos do |photo|
        #  photo.photo.url(:small)
        #end
      end
    end
    f.buttons
  end

end