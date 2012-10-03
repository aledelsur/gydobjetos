class SiteController < ApplicationController

  def index
    if params[:event] == "quienes-somos"
      @event = "quienes-somos"
      @paginations = Photo.paginate :per_page => 12, :page => params[:page] #This array is for testing pagination. Will be deleted
    elsif params[:event] == "contacto"
      @event = "contacto"
      @contact_page = Page.find_by_key("contacto")
    elsif params[:event] == "hogar"
      @event = "hogar"
      @hogar_page = Page.find_by_key("hogar")
      @paginations = Photo.paginate :per_page => 12, :page => params[:page] #This array is for testing pagination. Will be deleted
    elsif params[:event] == "bazar"
      @event = "bazar"
      @hogar_page = Page.find_by_key("bazar")
      @paginations = Photo.paginate :per_page => 12, :page => params[:page] #This array is for testing pagination. Will be deleted
    elsif params[:event] == "petit"
      @event = "petit"
      @hogar_page = Page.find_by_key("petit")
      @paginations = Photo.paginate :per_page => 12, :page => params[:page] #This array is for testing pagination. Will be deleted
    else
      @event = "home"
      @home_photos = HomePhoto.all
    end  
  end

  def new
    #Contact.new_contact(params).deliver
    #flash[:notice] = "Gracias! Tu consulta fue enviada."
    #@event = "contact"
    #render "index"
  end  

end
