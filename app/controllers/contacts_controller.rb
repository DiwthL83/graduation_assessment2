class ContactsController < ApplicationController
  protect_from_forgery

  def index
    @contact = Contact.new
    @contacts = Contact.all.order(cont_lname: :asc)
  end

  def new
  	@contact = Contact.new
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save?
      redirect_to @contact
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
  	@contact = Contact.find(params[:id])

  	if @contact.update(contact_params)
  		redirect_to @contact
    else
      render 'edit'
  	end
  end

  def delete
    @contact = Contact.find(params[:id])
    @contact.destroy

    redirect_to contacts_path
  end

private
  def contact_params
    params.require(:contact).permit(:cont_fname, :cont_lname, :cont_phone, :cont_email, :cont_tag)
  end

end
