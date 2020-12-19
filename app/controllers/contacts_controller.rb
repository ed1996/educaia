class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    puts "SENDGRID_USERNAME: #{ENV['SENDGRID_USERNAME']}"
    puts "SENDGRID_PASSWORD: #{ENV['SENDGRID_PASSWORD']}"
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
