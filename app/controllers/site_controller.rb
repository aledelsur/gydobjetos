class SiteController < ApplicationController

  def index
    if params[:event] == "quienes-somos"
      @event = "quienes-somos"
    elsif params[:event] == "contacto"
      @event = "contacto"
      @contact_page = Page.find_by_key("contacto")
    elsif params[:event] == "hogar"
      @event = "hogar"
    elsif params[:event] == "bazar"
      @event = "bazar"
    elsif params[:event] == "petit"
      @event = "petit"
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
