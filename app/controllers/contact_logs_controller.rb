class ContactLogsController < ApplicationController
  protect_from_forgery
  
  def index
  end

  def show
    @log_entry = ContactLog.new
    @log_entries = ContactLog.where(params[:contact_id]).order(:created_at :desc)
  end

  def new
    @log_entry = ContactLog.new
  end

  def create
    @log_entry = ContactLog.new(contact_log_params)

    if @log_entry.save?
      redirect_to contact_contact_logs_path
    else
      render 'new'
    end
  end

  def edit
    @log_entry = ContactLog.find(params[:id])
  end

  def update
    @log_entry = ContactLog.find(params[:id])

    if @log_entry.update?
      redirect_to
    else
      render 'edit'
    end
  end

  def destroy
    @log_entry = ContactLog.find(params[:id])
    @log_entry.destroy

    redirect_to contact_contact_logs_path
  end

private

  def contact_log_params
    params.require(:log_entry).permit(:notes)
  end

end
