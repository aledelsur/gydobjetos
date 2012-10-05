ActiveAdmin.register Photo do
  scope_to :current_page_photos

  controller do
    def current_page_photos
      if params[:page_id]
        Page.find(params[:page_id])
      end
    end
  end
end
