ActiveAdmin.register Photo do
  scope_to :current_page_photos
  actions :index, :edit, :update, :destroy

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

    def current_page_photos
      if params[:page_id]
        Page.find(params[:page_id])
      end
    end

    def upload_asset(params)
      file = params[:Filedata]
      mime_type = MIME::Types.type_for(file.original_filename).first
      file.content_type = mime_type
      photo = yield(file,mime_type)
      photo.save
    end

    def multifile_upload
      page = Page.find(params[:page_id])
      upload_asset params do |file, mime_type|
        Photo.new(photo: file, page: page, photo_content_type: mime_type)
      end
    end
  end
end
