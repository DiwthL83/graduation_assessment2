class ContactController < ApplicationController

  def index
    @contact = Contact.new
    @contacts = Contact.all
  end

  def new
  	@contact = Contact.new
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to @contact
    else
      render 'new'
    end
  	# redirect_to action: 'edit', id: @contact.id
  end

  def edit
  	@contact = Contact.find(params[:id])

  	if request.post?
  		@contact.update_attributes(params[:contact])
  		redirect_to action: 'edit', id: @contact.id
  	end
  end

  def delete
  end

private
  def contact_params
    params.require(:contact).permit(:cont_name, :cont_phone, :cont_email, :cont_tag)
  end

end
