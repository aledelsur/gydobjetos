class SiteController < ApplicationController
  
  require 'will_paginate/array'

  def index
    unless session[:not_first_time]
      render "welcome_page", :layout => false
      session[:not_first_time] = true
    else
      @event = params[:event]
      if params[:event] == "quienes-somos"
        @paginations = Photo.paginate :per_page => 12, :page => params[:page] #This array is for testing pagination. Will be deleted
        @about_page = Page.find_by_key("quienes-somos")
      elsif params[:event] == "contacto"
        @contact_page = Page.find_by_key("contacto")
      elsif params[:event] == "hogar"
        @page = Page.find_by_key("hogar")
        #@products = @page.categories.collect{|c| c.products}.paginate(:per_page => 12, :page => params[:page]).flatten
      elsif params[:event] == "bazar"
        @page = Page.find_by_key("bazar")
        #@products = @page.categories.collect{|c| c.products}.paginate(:per_page => 12, :page => params[:page]).flatten
      elsif params[:event] == "petit"
        @page = Page.find_by_key("petit")
        #@products = @page.categories.collect{|c| c.products}.paginate(:per_page => 12, :page => params[:page]).flatten
      else
        @event = "home"
        @home_photos = HomePhoto.all
      end
      @products = @page.get_products(params) if @page
    end  
  end

  #emails
  def new
    if params[:wedding_list]
      Contact.new_wedding_list(params).deliver
      flash[:notice] = "Gracias! Tu mail fue enviado. Te responderemos a la brevedad."
      @event = "wedding-list"
    elsif params[:contact]
      Contact.new_contact(params).deliver
      flash[:notice] = "Gracias! Tu consulta fue enviada.  Te responderemos a la brevedad."
      @event = "contacto"
    end
    redirect_to index_path(:event => @event)
  end  

  def load_product
    @product = Product.find(params[:id])
    render :partial=>"load_product", :locals => {:product => @product}
  end

end
