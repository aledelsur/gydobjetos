class SiteController < ApplicationController

  def index
    if params[:event] == "quienes-somos"
      @event = "quienes-somos"
      @paginations = Photo.paginate :per_page => 12, :page => params[:page] #This array is for testing pagination. Will be deleted
      @about_page = Page.find_by_key("quienes-somos")
    elsif params[:event] == "contacto"
      @event = "contacto"
      @contact_page = Page.find_by_key("contacto")

    elsif params[:event] == "hogar"
      @event = "hogar"
      @hogar_page = Page.find_by_key("hogar")
      @products = @hogar_page.categories.collect{|c| c.products}.paginate(:per_page => 12, :page => params[:page])
    elsif params[:event] == "bazar"
      @event = "bazar"
      @bazar_page = Page.find_by_key("bazar")
      @products = @bazar_page.categories.collect{|c| c.products}.paginate(:per_page => 12, :page => params[:page])
    elsif params[:event] == "petit"
      @event = "petit"
      @petit_page = Page.find_by_key("petit")
      @products = @petit_page.categories.collect{|c| c.products}.paginate(:per_page => 12, :page => params[:page])
    elsif params[:event] == "wedding-list"
      @event = "wedding-list"
    else
      @event = "home"
      @home_photos = HomePhoto.all
    end  
  end

  def new
    if params[:wedding_list]
      Contact.new_wedding_list(params).deliver
      flash[:notice] = "Gracias! Tu mail fue enviado. Te responderemos a la brevedad."
      @event = "wedding-list"
    elsif params[:contact]
      Contact.new_contact(params).deliver
      flash[:notice] = "Gracias! Tu consulta fue enviada.  Te responderemos a la brevedad."
      @event = "contact"
    end
    render "index"
  end  

  def load_section_photo
    #me pide que levante el array, pero no. renderizar a otra vista con la modal solamente
    @image = Photo.find(params[:id])
    render :partial=>"site_sections"
  end

end
