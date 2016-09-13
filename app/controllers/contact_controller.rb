class ContactController < ApplicationController

  def index
  end

  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.create(params[:contact])
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

end
