class ApplicationController < ActionController::Base
  protect_from_forgery
  I18n.locale = 'es'
  before_filter :load_categories
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end 

  def site_values 
    ActionMailer::Base.default_url_options[:host] = 'localhost:3000'
    #@contact_page = Page.find_by_key("contacto")
    
    #Let's create Page "home" for getting metas?
    #@meta_title = Page.find_by_key("Inicio").meta_title
    #@meta_description = Page.find_by_key("Inicio").meta_description
  end

  def load_categories
    hogar = Page.find_by_key("hogar")
    @hogar_categories = hogar.categories if hogar
    bazar = Page.find_by_key("bazar")
    @bazar_categories = bazar.categories if bazar
    petit = Page.find_by_key("petit")
    @petit_categories = petit.categories if petit
  end
end
