class ContactsController < ApplicationController

  def index
    @contact = Contact.new
    @contacts = Contact.all.order(cont_lname: :asc)
  end

  def new
  	@contact = Contact.new
  end

  def show
    @contact = Contact.find(params[:id])
    @log_entries = Contact_log.find(params[:contact_id])
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save

    redirect_to action: "index"
  end

  def edit
  	@contact = Contact.find(params[:id])

  	if request.post?
  		@contact.update_attributes(contact_params)
  		redirect_to action: 'edit', id: @contact.id
  	end
  end

  def update
  end

  def delete
  end

private
  def contact_params
    params.require(:contact).permit(:cont_fname, :cont_lname, :cont_phone, :cont_email, :cont_tag)
  end

end
