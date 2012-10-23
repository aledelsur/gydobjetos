ActiveAdmin.register Category do

  scope_to :page_categories
  config.clear_sidebar_sections!
  actions :index, :create, :edit, :update, :destroy
  
  menu :label => "Productos", :if => proc {current_admin_user.has_role? :super_admin}

  index do
    column :name
    column "" do |category|
      link_to "Ver productos", admin_products_path(:category_id=>category.id)
    end
    column "" do |category|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.edit'), edit_admin_category_path(:id=>category.id, :page_id=>category.page_id), :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), admin_category_path(:id=>category.id, :page_id=>category.page_id), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links
    end
  end

  action_item :only => :index do
    if params[:page_id]
      link_to "Nueva Categoria", new_category_path(:page_id=>params[:page_id])
    end
  end

  controller do

    def page_categories
      if params[:page_id]
        Page.find(params[:page_id])
      end
    end

    def new_category
      @page_id = Page.find(params[:page_id]).id
      @pages = Page.all
    end

    def create
      @category = Category.create(params[:category])
      redirect_to admin_categories_path(:page_id => params[:category][:page_id])
    end

    def edit
      @page_id = @category.page_id
    end

    def update
      @category = Category.find(params[:id])
      @category.update_attributes params[:category]
      redirect_to admin_categories_path(:page_id => params[:category][:page_id])
    end

    def destroy
      @category = Category.find(params[:id])
      if @category
        @category.destroy
      end
      redirect_to admin_categories_path(:page_id => params[:page_id])
    end    

  end

end
