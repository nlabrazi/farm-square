class ContactsController < ApplicationController
  #before_action :skip_authorization

  def index
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    @contact.message += "\nEcrit par : " + @contact.email
    @contact.email = 'farm-square@outlook.fr'
    if @contact.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = 'Cannot send message'
      render :new
    end
  end

end
