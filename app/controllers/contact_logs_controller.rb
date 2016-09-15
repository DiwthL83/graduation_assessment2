class ContactLogsController < ApplicationController
  def index
  end

  def show
    @log_entries = ContactLog.all
  end

  def new
    @log_entry = ContactLog.new
  end

  def edit
    @log_entry = ContactLog.find(params[:id])
  end

  def create
    @log_entry = ContactLog.new
    @log_entry.save(contact_log_params)
  end

  def update
  end

  def destroy
  end

private

  def contact_log_params
    require(:contact_log).permit(:notes)
  end

end
