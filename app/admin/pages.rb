ActiveAdmin.register Page do
  
  actions :index, :edit, :update

  # index do 
  #   column :title
  #   default_actions
  #   column "Fotos" do |p|
  #     link_to "Subir/Bajar Fotos", admin_photos_path(:page_id => p.id) 
  #   end
  # end
  
  config.clear_sidebar_sections!

  index do 
    column :title
    column "" do |p|
      if p.key == "hogar" || p.key == "bazar" || p.key == "petit"
        link_to "Ver Categorias", admin_categories_path(:page_id => p.id) 
      end
    end
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
