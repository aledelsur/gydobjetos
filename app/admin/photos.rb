ActiveAdmin.register Photo do
  scope_to :current_page_photos
  actions :index, :edit, :update, :destroy
  menu :label => "Fotos", :if => proc{ current_admin_user.has_role? :admin}

  sidebar "Subir Fotos" do
    
    div do 
      raw "<input type='file' name='file_upload' id='multifile-uploader' />"
    end
    div do
      render "uploadify"
    end
  end

  index do 
    column :title
    column :code
    column :photo do |p|
      image_tag (p.photo.url(:small)), :style=> "width: 170px;"
    end
    default_actions
    column "photos" do |p|
      link_to "abm fotos", admin_photos_path(:page_id => p.id) 
    end
  end

  filter :title

  controller do
    skip_before_filter :verify_authenticity_token
    
    def current_page_photos
      if params[:page_id]
        Page.find(params[:page_id])
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
      page = Page.find(params[:page_id])
      upload_asset params do |file, mime_type|
        photo = Photo.new(photo: file, page: page, photo_content_type: mime_type.to_s)
        photo.photo_content_type = mime_type
        photo
      end
    end
  end
end
