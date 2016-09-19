class ContactLogsController < ApplicationController
  protect_from_forgery
  
  def index
  end

  def show
  end

  def new
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @log_entry = @contact.contact_logs.create(contact_log_params)

    redirect_to contact_path(@contact)
  end

  def edit
  end

  def update
  end

  def destroy
    @contact = Contact.find(params[:contact_id])
    @log_entry = @contact.contact_logs.find(params[:id])
    @log_entry.destroy

    redirect_to contact_path(@contact)
  end

private

  def contact_log_params
    params.require(:contact_log).permit(:notes)
  end

end
