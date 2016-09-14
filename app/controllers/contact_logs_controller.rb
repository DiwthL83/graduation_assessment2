class ContactLogsController < ApplicationController
  def index
  end

  def show
    @log_entries = Contact_log.all
  end

  def new
    @log_entry = Contact_log.new
  end

  def edit
    @log_entry = Contact_log.find(params[:id])
  end

  def create
    @log_entry = Contact.Contact_log.create
  end

  def update

  end

  def destroy

  end

private
  def contact_log_params
    
  end

end
