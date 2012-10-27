ActiveAdmin.register Product do

  scope_to :category_products

  menu :label => "Productos", :if => proc { current_admin_user.has_role? :super_admin }

  filter :code
  filter :title

  actions :index, :create, :edit, :update, :destroy

  index do
    column :code
    column "" do |product|
      link_to "Fotos", admin_photos_path(:product_id => product.id)
    end
    column "" do |product|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.edit'), edit_admin_product_path(:id=>product.id, :category_id=>product.category_id), :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), admin_product_path(:id=>product.id, :category_id=>product.category_id), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links
    end

  end


  action_item :only => :index do 
    if params[:category_id]
      link_to "Nuevo Producto", new_product_path(:category_id => params[:category_id])
    end
  end

  controller do


    def category_products
      if params[:category_id]
        Category.find(params[:category_id])
      end
    end

    def new_product
      @category_id = Category.find(params[:category_id]).id
      @categories = Category.all
    end

    def create
      @product = Product.create(params[:product])
      redirect_to admin_products_path(:category_id => params[:product][:category_id])
    end

    def edit
      @category_id = @product.category_id
    end

    def update
      @product = Product.find(params[:id])
      @product.update_attributes params[:product]
      redirect_to admin_products_path(:category_id => params[:category_id])
    end

    def destroy
      @product = Product.find(params[:id])
      if @product
        @product.destroy
      end
      redirect_to admin_products_path(:category_id => params[:category_id])
    end

  end
  
end
