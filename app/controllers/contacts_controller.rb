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
    l_contact = @contact.contact_logs.max.created_at
    tm_nbr = Time.now-l_contact

    if tm_nbr > 1.year
      @time_ago = pluralize((tm_nbr/1.year).round, "year") + " ago"
    elsif tm_nbr > 1.month
      @time_ago = pluralize((tm_nbr/1.month).round, "month") + " ago"
    elsif tm_nbr > 1.week
      @time_ago = pluralize((tm_nbr/1.week).round, "week") + " ago"
    elsif tm_nbr > 1.day
      @time_ago = pluralize((tm_nbr/1.day).round, "day") + " ago"
    else
      @time_ago = "Today"
    end
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
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

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    redirect_to contacts_path
  end

private
  def contact_params
    params.require(:contact).permit(:cont_fname, :cont_lname, :cont_phone, :cont_email, :cont_tag)
  end

end
