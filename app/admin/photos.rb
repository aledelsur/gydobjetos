ActiveAdmin.register Photo do
  scope_to :current_product_photos
  actions :index, :destroy
  menu :label => "Fotos", :if => proc{ current_admin_user.has_role? :admin }
  config.clear_sidebar_sections!

  sidebar "Subir Fotos" do
    
    div do 
      raw "<input type='file' name='file_upload' id='multifile-uploader' />"
    end
    div do
      render "uploadify"
    end
  end

  index do 
    column :photo do |p|
      image_tag (p.photo.url(:small)), :style=> "width: 170px;"
    end
    default_actions
  end

  filter :title

  controller do
    skip_before_filter :verify_authenticity_token
    
    def current_product_photos
      if params[:product_id]
        Product.find(params[:product_id])
      end
    end

    def upload_asset(params)
      file = params[:Filedata]
      mime_type = MIME::Types.type_for(file.original_filename).first
      file.content_type = "#{mime_type}"
      m = yield(file, mime_type)
      fkey = file.original_filename
      resp = {}
      if m.save
        resp[:id] = m.id.to_s
        resp[:url]= m.photo.url(:small)
      else
        resp[:errors] = m.errors.messages
      end
      
      return resp
    end

    def multifile_upload
      product = Product.find(params[:product_id])
      upload_asset params do |file, mime_type|
        photo = Photo.new(photo: file, product: product, photo_content_type: mime_type.to_s)
        photo.photo_content_type = mime_type.to_s
        photo
      end
    end
  end
end
