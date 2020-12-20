class ContactsController < ApplicationController
  require 'sendgrid-ruby'
  include SendGrid
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = 'Impossible d\'envoyer.'
      render :new
    end
  end
end
