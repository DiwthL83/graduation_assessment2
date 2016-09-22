class ApiController < ApplicationController
  def contacts
  	if ContactLog.all.length > 0
  		@contacts = Contact.select("cont_fname","cont_lname","created_at").joins(:contact_logs).group("contact_id","cont_fname","cont_lname").maximum(:created_at)
  	else
  		@contacts = Contact.select("cont_fname","cont_lname")
  	end
  	# a = Contact.select("id","cont_fname","cont_lname").distinct
  	# b = ContactLog.select("contact_id","created_at").group("contact_id").maximum(:created_at)
  end
end
